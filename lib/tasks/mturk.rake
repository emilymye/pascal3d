namespace :mturk do
  task :test => :environment do |t, args|


    hit_params = YAML::load_file('config/hits/bounding_box.yml' )

    img = Image.first
    url  = INIT_CONFIG['HOST_BASE_URL'] + 'mturk/bounding_box/#{img.id}'
    p hit_params

    RTurk::Hit.create(:title => hit_params[:title] ) do |hit|
      hit.max_assignments = 2
      hit.description = 'blah'
      hit.question(url,:frame_height => 1000)  # pixels for iframe
      hit.reward = 0.05
      hit.qualifications.add :approval_rate, { :gt => 80 }
    end
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
      hit.qualifications.add :approval_rate, { :gt => 80 }
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
      hit.qualifications.add :approval_rate, { :gt => 80 }
    end
  end
end