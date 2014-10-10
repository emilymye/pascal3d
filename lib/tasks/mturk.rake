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
	p "WorkerID : #{assignment.worker_id}"
	p "Assignment.status : #{assignment.status}"

	# if assignment.status == 'Submitted'
	#   p "Reject the HIT!"
	#   assignment.reject!("You submitted empty answer. Sorry for the rejection.")
	#   next
	# end
	RTurk::Utilities.retry_on_unavailable(1) do
	  if assignment.status == 'Rejected'
	    next
	  end
	  # if assignment.status == 'Submitted'
          #   p "Reject this worker's HIT!!!"
          #   assignment.reject!("You submitted empty answer. Sorry for the rejection.")
          #   next
          # end
	  if assignment.worker_id == 'ASTUVXX56HNU2' && assignment.status == 'Submitted'
	    p "Reject this worker's HIT!!!"
	    assignment.reject!("You haven't rotated in an appropriate way. Also, you chose wrong answers for the q1 and q2. Sorry for the rejection.")
	    # if assignment.status == 'Submitted'
	    next
	  end
	end
	
	if assignment.status == 'Rejected'
	  p "Go on to the next assignment!!!"
	  next
	end	
	if assignment.worker_id == 'ASTUVXX56HNU2' && assignment.status == 'Submitted'
	  p "Go on to the next assignment!!!"
	  next
	end
        
	answers = assignment.answers
        type = answers["task"]
        
        case type
          when "bounding_box"
            boundingboxes = JSON.parse(answers["bounding_boxes"])
	    if boundingboxes.length == 0
	      p "No bounding box chosen"
	      annotations << Annotation.new_from_hit({
		"image_file"=>answers["image_file"],
		"category_name"=>answers["category_name"],
		"x0" => 0,
		"y0" => 0,
		"x1" => 0,
		"y1" => 0,
		"bbox_validity" => answers["bbox_validity"]
	      })
	    else
            boundingboxes.each do |bb|
              annotations << Annotation.new_from_hit({
                "image_file"=>answers["image_file"],
                "category_name"=> answers["category_name"],
                "x0" => bb["x0"],
                "y0" => bb["y0"],
                "x1" => bb["x1"],
                "y1" => bb["y1"],
	        "bbox_validity" => answers["bbox_validity"]
              })
            end
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

        p "Processing HIT, type #{type} - #{annotations.count} annotations"
        incorrectcnt = 0
        annotations.each do |a| 
          if a.save
            p "Annotation was successfully saved"
            if (autosubmit and a.stage != Annotation::STAGES[:complete])
              a.submit_hit(hit_param_types) 
            end
          else
            incorrectcnt += 1
            p a.errors
            p "Annotation was not saved, skipping"
          end
        end
        
        RTurk::Utilities.retry_on_unavailable(1) do
          if (incorrectcnt < 0.4 * annotations.count) 
            p "Annotation accuracy acceptable, approving assignment"
            assignment.approve! if assignment.status == 'Submitted'
          else
            p "Annotation rejected, rejecting assignment"
            assignment.reject! if assignment.status == 'Submitted'
          end
        end
      end
      RTurk::Utilities.retry_on_unavailable(1) do
        hit.expire!
        hit.dispose!
      end
    end
  end

  task :expire_annotations, [:id1, :id2] => :environment do |t, args|
    id1 = args[:id1]
    id2 = args[:id2]
   
    hits = RTurk::Hit.all
    next if hits.empty?

    for id in args[:id1]..args[:id2]
    end 

    puts "Expiring hits"
    hits.each do |hit|

      hit.assignments.each do |assignment|

        p "assignment.id is #{assignment.id}"

        if assignment.id >= id1 && assignment.id <= id2
  	  p "inside the if statement"
	  #RTurk::Utilities.retry_on_unavailable(1) do
  	  #  hit.disable!
	  #end
	  break
        end

      end # end assignments loop
    end # end hits loop
  end

  desc 'expire all hits uploaded'
  task :expire_all => :environment do

      hits = RTurk::Hit.all
      puts "#{hits.size} hits.\n"
      next if hits.empty?
    
      puts "Expiring all hits"
      hits.each do |hit|
        RTurk::Utilities.retry_on_unavailable(1) do
          # unless expired ==> STAGE==Unassignmable
          #hit.expire!
          #hit.dispose!
          hit.disable!
        end
      end
  end # end task

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

  desc 'Read csv file of images and their bounding box annotations, and creates new mesh HITs'
  task :submit_hits_mesh, [:bbox_list] => :environment do |t, args|

    # read mesh HIT configuration
    hit_params = YAML::load_file('config/hits/mesh.yml')
    abort("config/hits/mesh.yml not found") if hit_params.nil?

    # fetch csv file path from the input argument
    # row: [filename,category,x0,y0,x1,y1,image_height,image_width]
    csv_path = args[:bbox_list]
    abort("1 argument expected: path to csv file listing bounding box annotations") if csv_path.nil?

    # read :bbox_list csv file
    p "Reading CSV file #{csv_path}"
    count = 0
    CSV.foreach(csv_path) do |row| # read a line at a time
      count = count+1
      begin
	# read image path, category and bbox info from the row
	image_path = row[0]
	category = row[1]
	x0 = row[2]
	x1 = row[4]
	y0 = row[3]
	y1 = row[5]
	h = row[6]
	w = row[7]
	
	# for debugging
	p "image_path is "+image_path
	p "category is "+category
	p "bbox is "+x0+" "+x1+" "+y0+" "+y1
	p "image height is "+h
	p "image width is "+w
	
	# check existence of image path, category and bbox annotation
	abort("six arguments expected: image path, category, x0, x1, y0, y1") if image_path.nil? or category.nil? or x0.nil? or x1.nil? or y0.nil? or y1.nil? or h.nil? or w.nil?
	abort("image file not found in app/assets/images") if Rails.application.assets.find_asset(image_path).nil?
	abort("invalid category") if Category.find_by_name(category).nil?
	abort("config/hits/mesh.yml not found") if hit_params.nil?	

	# load config files
        mesh_params = YAML::load_file('config/hits/mesh.yml' )
        orientation_params = YAML::load_file('config/hits/orientation.yml' )
        keypoint_params = YAML::load_file('config/hits/keypoints.yml' )
        hit_param_types = {mesh: mesh_params, orientation: orientation_params, keypoint: keypoint_params}

	# save annotation to db
	annotation = Annotation.create({:image_file => image_path, :category_name => category, :stage => 1,
				       :x0 => x0, :x1 => x1, :y0 => y0, :y1 => y1, :image_width => w, :image_height => h})
	rturk_hit = annotation.submit_hit(hit_param_types)
	p "Successfully submitted hit #{rturk_hit.id}"
	p "annotation.id is #{annotation.id}"	
	#if annotation.save
	#  p "Annotation was successfully saved"
	#  rturk_hit = annotation.submit_hit(hit_param_types)
	#  p "Successfully submitted hit #{rturk_hit.id}"
	#else
	#  annotation.errors
	#  p "Annotation was not saved, skipping"
	#end

      rescue StandardError => e
	p "Unable to submit HIT for row #{count}:#{row.to_s}"
	p e
	next
      end
    end # end CSV.foreach
  end # end task

  desc 'Read csv file of images with bbox and mesh annotations, and creates new orientation HITs'
  task :submit_hits_orientation, [:anno_list] => :environment do |t, args|

    # read orientation HIT configuration
    hit_params = YAML::load_file('config/hits/orientation.yml')
    abort("config/hits/orientation.yml not found") if hit_params.nil?

    # fetch csv file path from the input argument
    # row: [filename,category,x0,y0,x1,y1,image_height,image_width]
    csv_path = args[:anno_list]
    abort("1 argument expected: path to csv file listing bounding box and mesh annotations") if csv_path.nil?

    # read :anno_list csv file
    p "Reading CSV file #{csv_path}"
    count = 0
    CSV.foreach(csv_path) do |row| # read a line at a time
      count = count+1
      begin
        # read image path, category and bbox info from the row
        image_path = row[0]
        category = row[1]
        x0 = row[2]        
        y0 = row[3]
        x1 = row[4]
        y1 = row[5]
        h = row[6]
        w = row[7]
        meshname = row[8]
  
        # for debugging
        p "image_path is " + image_path
        p "category is " + category
        p "bbox is " + x0 + " " + y0 + " " + x1 + " " + y1
        p "image size [h,w] is [" + h + ", " + w + "]"
        p "mesh is " + meshname
        
        # check existence of image path, category and bbox annotation
        abort("Required arguments: image path, category, x0, y0, x1, y1, h, w") if image_path.nil? or category.nil? or x0.nil? or x1.nil? or y0.nil? or y1.nil? or h.nil? or w.nil? or meshname.nil?
        abort("image file not found in app/assets/images") if Rails.application.assets.find_asset(image_path).nil?
        abort("invalid category") if Category.find_by_name(category).nil?
        abort("config/hits/orientation.yml not found") if hit_params.nil?

        # load config files
        mesh_params = YAML::load_file('config/hits/mesh.yml' )
        orientation_params = YAML::load_file('config/hits/orientation.yml' )
        keypoint_params = YAML::load_file('config/hits/keypoints.yml' )
        hit_param_types = {mesh: mesh_params, orientation: orientation_params, keypoint: keypoint_params}

        # save annotation to db
        annotation = Annotation.create({:image_file => image_path, :category_name => category, :stage => 2,
         :x0 => x0, :x1 => x1, :y0 => y0, :y1 => y1, :image_width => w, :image_height => h, :mesh => meshname})
        rturk_hit = annotation.submit_hit(hit_param_types)
        p "Successfully submitted hit #{rturk_hit.id}"
        p "annotation.id is #{annotation.id}"

      rescue StandardError => e
        p "Unable to submit HIT for row #{count}:#{row.to_s}"
        p e
        next
      end # end begin
    end # end CSV.foreach

  end # end task


  desc 'Read csv file of images with bbox, mesh, orientation annotations, and creates new keypoints HITs'
  task :submit_hits_keypoints, [:anno_list] => :environment do |t, args|

    # read keypoints HIT configuration
    hit_params = YAML::load_file('config/hits/keypoints.yml')
    abort("config/hits/keypoints.yml not found") if hit_params.nil?

    # read csv file from the input argument
    # row: [filename, category, x0,y0,x1,y1,image_height,image_width,mesh,azimuth,elevation]
    csv_path = args[:anno_list]
    abort("1 argument expected: path to csv file listing bbox, mesh and orientation annotations") if csv_path.nil?

    # read :anno_list csv file
    p "Reading CSV file #{csv_path}"
    count = 0
    CSV.foreach(csv_path) do |row|
      count = count + 1
      begin
        # parse and read each element in the row
        image_path = row[0]
	category = row[1]
	x0 = row[2]
	y0 = row[3]
	x1 = row[4]
	y1 = row[5]
	h = row[6]
	w = row[7]
	meshname = row[8]
	elevation = row[9]
	azimuth = row[10]

	# for debugging
	p "image_path is " + image_path
	p "category is " + category
	p "bbox is " + x0 + " " + y0 + " " + x1 + " " + y1
	p "image size [h,w] is [" + h + ", " + w + "]"
	p "mesh is " + meshname

	# check existence of image paht, category, bbox, mesh, orientation annotations
	abort("Required arguments: image path, category, x0, y0, x1, y1, h, w, mesh,  elevation, azimuth") if image_path.nil? or category.nil? or x0.nil? or x1.nil? or y0.nil? or y1.nil? or h.nil? or w.nil? or meshname.nil? or azimuth.nil? or elevation.nil?
	abort("image file not found in app/assets/images") if Rails.application.assets.find_asset(image_path).nil?
	abort("invalid category") if Category.find_by_name(category).nil?
	abort("config/hits/orientation.yml not found") if hit_params.nil?

	# load config files
	mesh_params = YAML::load_file('config/hits/mesh.yml' )
        orientation_params = YAML::load_file('config/hits/orientation.yml' )
	keypoint_params = YAML::load_file('config/hits/keypoints.yml' )
	hit_param_types = {mesh: mesh_params, orientation: orientation_params, keypoint: keypoint_params}

        # save annotation to db
        annotation = Annotation.create({:image_file => image_path, :category_name => category, :stage => 3,
         :x0 => x0, :x1 => x1, :y0 => y0, :y1 => y1, :image_width => w, :image_height => h, :mesh => meshname, :azimuth => azimuth, :elevation => elevation})
        rturk_hit = annotation.submit_hit(hit_param_types)
        p "Successfully submitted hit #{rturk_hit.id}"
        p "annotation.id is #{annotation.id}"

      rescue StandardError => e
        p "Unable to submit HIT for row #{count}:#{row.to_s}"
        p e
        next			
      end # end begin
    end # end CSV.foreach
  end # end task

end # end namespace
