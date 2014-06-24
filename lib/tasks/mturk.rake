require 'csv'

namespace :mturk do
  def create_hit(hit_params, url)
    if INIT_CONFIG["HOST_BASE_URL"].starts_with?("localhost")
      p "running on localhost...not submitting to MTurk" and return
    end
    begin
      RTurk::Utilities.retry_on_unavailable(1) do 
        rturk_hit = RTurk::Hit.create(:title => hit_params[:title] ) do |hit|
          hit.description = hit_params[:description]
          hit.reward = hit_params[:reward]
          hit.max_assignments = hit_params[:num_assignments]

          hit.duration = hit_params[:duration]
          hit.lifetime = hit_params[:lifetime]

          hit.keywords = hit_params[:keywords]
          hit_params[:qualifications].each{ |k, v| hit.qualifications.add(k,v) }
          hit.auto_approval = hit_params[:auto_approval]
          hit.question(url,:frame_height => 700)
        end
        p rturk_hit.url unless rturk_hit.nil?
        return rturk_hit
      end
    rescue StandardError => e
      p "Unable to submit hit for #{url}: #{e.to_s}"
    end
  end

  desc 'Read csv file of images (filename, category) and creates new bounding box HITS'
  task :submit_list, [:image_list ] => :environment do |t, args|
    hit_params = YAML::load_file('config/hits/bounding_box.yml' )
    abort("bounding_box hit format not found in config/hits") if hit_params.nil?

    csv_path = args[:image_list]
    abort("1 argument expected: path to csv file listing images (filename, category)") if csv_path.nil?
    p "Reading CSV file #{csv_path}"
    count = 0
    CSV.foreach(csv_path) do |row|
      count=count+1;
      begin 
        image_path = row[0]
        category = row[1]
        abort("two arguments expected: image path, category") if category.nil? or image_path.nil?
        abort("image file not found in app/assets/images") if Rails.application.assets.find_asset(image_path).nil?
        abort("invalid category") if Category.find_by_name(category).nil?
        abort("bounding_box hit format not found in config/hits") if hit_params.nil?

        queryparams = {:image => image_path, :category => category}

        url = INIT_CONFIG["HOST_BASE_URL"] + "mturk/new_annotation?" + queryparams.to_query
        hit = create_hit(hit_params,url)
        p "Successfully submitted hit #{hit.id}"

      rescue StandardError => e
        p "Unable to submit HIT for row #{count}:#{row.to_s}"
        p e
        next
      end
    end
  end


  desc 'submit an image; format mturk:submit_image[image_path,category]'
  task :submit_image, [:image_path, :category] => :environment do |t, args|
    image_path = args[:image_path]
    category = args[:category]
    abort("two arguments expected: image path, category") if category.nil? or image_path.nil?
    abort("image file not found in app/assets/images") if Rails.application.assets.find_asset(image_path).nil?
    abort("invalid category") if Category.find_by_name(category).nil?
  
    hit_params = YAML::load_file('config/hits/bounding_box.yml' )
    abort("bounding_box hit format not found in config/hits") if hit_params.nil?

    queryparams = {:image => image_path, :category => "aeroplane"}

    url = INIT_CONFIG["HOST_BASE_URL"] + "mturk/new_annotation?" + queryparams.to_query
    hit = create_hit(hit_params,url)
    p "Successfully submitted hit #{hit.id}"
  end


  desc 'sync Mechanical Turk HITs'
  task :sync_all, [ :autosubmit ] => :environment do |t, args|
    autosubmit = args[:autosubmit] || false
    hit_param_types = {}
    if (autosubmit)
      mesh_params = YAML::load_file('config/hits/mesh.yml' )
      orientation_params = YAML::load_file('config/hits/orientation.yml' )
      keypoint_params = YAML::load_file('config/hits/keypoints.yml' )
      hit_param_types = {mesh: mesh_params, orientation: orientation_params, keypoint: keypoint_params}
    end


    hits = RTurk::Hit.all_reviewable
    puts "#{hits.size} reviewable hits. \n"
    
    next if hits.empty? 
    
    annotations = []

    puts "Reviewing all assignments"
    hits.each do |hit|
      hit.assignments.each do |assignment|
        answers = assignment.answers
        type = answers["task"]
        
        case type
          when "bounding_box"
            boundingboxes = JSON.parse(answers["bounding_boxes"])
            boundingboxes.each do |bb|
              annotations << Annotation.new_from_hit({
                "image_file"=>answers["image_file"],
                "category_name"=> answers["category_name"],
                "x0" => bb["x0"],
                "y0" => bb["y0"],
                "x1" => bb["x1"],
                "y1" => bb["y1"]
              })
            end
          when "mesh", "orientation", "keypoints"
            aid = answers["annotation_id"].to_i
            annotation = Annotation.find(aid)
            if annotation.nil?
              p "Error, no annotation with id #{aid}"
              RTurk::Utilities.retry_on_unavailable(1) do
                assignment.reject!
              end
              next
            end
            annotation.update_from_hit(type, answers)
            annotations << annotation
          else 
            p 'error: HIT #{hit.id}, assignment #{assignment.id} has no task type'
            RTurk::Utilities.retry_on_unavailable(1) do
              assignment.reject!
            end
            next
        end

        p "Processing HIT, type #{type}"
        annotations.each do |a| 
          if a.save
            RTurk::Utilities.retry_on_unavailable(1) do
              assignment.approve! if assignment.status == 'Submitted'
              p "Annotation was successfully updated"
            end
            if (autosubmit and a.stage != Annotation::STAGES[:complete])
              a.submit_hit(hit_param_types) 
            end
          else 
            p a.errors
            p "Annotation rejected, rejecting assignment"
            RTurk::Utilities.retry_on_unavailable(1) do
              assignment.reject! if assignment.status == 'Submitted'
            end
          end
        end
      end
      RTurk::Utilities.retry_on_unavailable(1) do
        hit.expire!
        hit.dispose!
      end
    end
  end


  desc 'submit annotations ready to be edited'
  task :resubmit => :environment do |t,args|
    mesh_params = YAML::load_file('config/hits/mesh.yml' )
    orientation_params = YAML::load_file('config/hits/orientation.yml' )
    keypoint_params = YAML::load_file('config/hits/keypoints.yml' )
    hit_param_types = {mesh: mesh_params, orientation: orientation_params, keypoint: keypoint_params}

    count = 0

    to_submit = Annotation.where( "stage < ? and submitted = 'f'", Annotation::STAGES[:complete])
    if (to_submit.count == 0)
      p "No annotation to submitted"
      next
    end

    to_submit.each do |a|
      rturk_hit = a.submit_hit(hit_param_types)
      count = count+1 unless rturk_hit.nil?
    end
    p "#{count} annotations successfully submitted"
  end
  
  desc 'reset all annotations and delete hits'
  task :reset => :environment do
    Annotation.update_all(submitted: false)
    hits = RTurk::Hit.all
    p "#{hits.count} HITS to delete, approving all assignments"
    hits.each do |h|
      h.assignments.each do |a|
        a.approve! if a.status == 'Submitted'
      end
      h.expire!
      h.dispose!
    end
  end
end
