namespace :mturk do
  task :test => :environment do |t, args|
    hit_params = YAML::load_file('config/hits/bounding_box.yml' )
    queryparams = {:image => "annotate/aeroplane/2008_000021.jpg", :category => "aeroplane"}

    url = INIT_CONFIG["HOST_BASE_URL"] + "mturk/new_annotation?" + queryparams.to_query
    p hit_params
    p url

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

    p rturk_hit.id
  end

  task :submit_image, [:image_name] => :environment do |t, args|
    hit_params = YAML::load_file('config/hits/bounding_box.yml' )

    img = Image.first
    url  = HOST_BASE_URL + 'mturk/bounding_box/#{img.id}'
    p hit_params

    RTurk::Hit.create(:title => hit_params[:title] ) do |hit|
      hit.max_assignments = 2
      hit.description = 'blah'
      hit.question(url,:frame_height => 1000)  # pixels for iframe
      hit.reward = 0.05

    end
  end

  task :sync => :environment do |t, args|
    mesh_params = YAML::load_file('config/hits/mesh.yml' )
    orientation_params = YAML::load_file('config/hits/orientation.yml' )
    keypoints_params = YAML::load_file('config/hits/keypoints.yml' )

    RTurk::Hit.create(:title => hit_params[:title] ) do |hit|
      hit.max_assignments = 2
      hit.description = 'blah'
      hit.question(url,:frame_height => 1000)  # pixels for iframe
      hit.reward = 0.05
      hit.duration = 
      hit.qualifications.add :approval_rate, { :gt => 80 }

    end
  end
end