namespace :annotation do

  desc 'delete annotations with specific id'
  task :delete, [:id] => :environment do |t, args|

    id = args[:id]
    p "No annotation with #{id}, returning" and next if Annotation.find_by_id(id).nil?
    Annotation.destroy(id)
    p "Annotation with id #{id} deleted"
  end

  desc 'delete all annotations'
  task :delete_all => :environment do
    count = Annotation.destroy_all
    p "#{count} annotations deleted"
  end

  desc 'delete complete annotations'
  task :delete_complete => :environment do
    count = Annotation.destroy_all(stage: Annotation::STAGES[:complete])
    p "#{count} annotations deleted"
  end


  desc 'export all completed annotations'
  task :export_complete, [:filename ] => :environment do |t,args|
    file = args[:filename] || "annotation_results.csv"

    p "Error - Export filename must have .csv extension" and next if file[-4..-1] != ".csv"
    completed = Annotation.where(stage: Annotation::STAGES[:complete])
    p "No annotations to export (still incomplete: #{Annotation.count})" and next if completed.empty?

    CSV.open("results/" + file, "wb") do |csv|
      completed.each do |annotation|
        csv << annotation.export
      end
    end
    p "Written to results/#{file}"
  end

  desc 'export all completed annotations - takes file name and one of ["bounding_box", "mesh", "orientation", "keypoints"] for last finished task. Keypoints is the same as complete.'
  task :export_by_task, [:task,:filename] => :environment do |t,args|
    file = args[:filename] || "annotation_results.csv"
    p "Error - Export filename must have .csv extension" and next if file[-4..-1] != ".csv"
    
    possible_tasks = ["bounding_box", "mesh", "orientation", "keypoints"]
    task = args[:task] 
    p "No task type given" and next if task.nil?
    idx = possible_tasks.index(task)
    p "Incorrect task type given: #{task}" and next if idx.nil? 

    annotations = Annotation.where(stage: idx+1)
    p "No annotations of type #{task}" and next if annotations.empty? 
    CSV.open("results/" + file, "w") do |csv|
      annotations.each do |annotation|
        csv << annotation.export
      end
    end
    p "Written to results/#{file}"
  end

end
