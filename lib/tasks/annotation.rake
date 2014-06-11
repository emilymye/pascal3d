namespace :annotation do

  desc 'delete complete annotations'
  task :delete_complete => :environment do
    count = Annotation.delete_all(stage: Annotation::STAGES[:complete])
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

    annotations = Annotation.where(stage: Annotation::STAGES[idx + 1])
    CSV.open("results/" + file, "wb") do |csv|
      annotations.each do |annotation|
        csv << annotation.export
      end
    end
    p "Written to results/#{file}"
  end

end