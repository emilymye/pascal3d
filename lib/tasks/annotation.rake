namespace :annotation do

  desc 'delete complete annotations'
  task :delete_complete => :environment do
    count = Annotation.delete_all(stage: Annotation::STAGES[:complete])
    p "#{count} annotations deleted"
  end


  desc 'export all completed annotations'
  task :export_complete, [:filename, :delete_record] => :environment do |t,args|
    file = args[:filename] || "annotation_results.csv"
    delete = ( args[:delete_record] == "false" )

    p "Error - Export filename must have .csv extension" and next if file[-4..-1] != ".csv"
    completed = Annotation.where(stage: Annotation::STAGES[:complete])
    p "No annotations to export (still incomplete: #{Annotation.count})" and next if completed.empty?

    count = 0
    CSV.open("results/" + file, "wb") do |csv|
      completed.each do |annotation|
        csv << annotation.export
        if delete
          annotation.delete
          count=count+1
        end
      end
    end
    p "Written to results/#{file}"
    p "#{count} annotations deleted" if delete
  end

  desc 'export all completed annotations - takes file name and one of ["bounding_box", "mesh", "orientation", "keypoints"] for last finished task. Keypoints is the same as complete.'
  task :export, [:filename, :last_task] => :environment do |t,args|
    file = args[:filename] || "annotation_results.csv"
    p "Error - Export filename must have .csv extension" and next if file[-4..-1] != ".csv"
    
    possible_tasks = ["bounding_box", "mesh", "orientation", "keypoints"]
    task = args[:task] 
    p "No task type given" and next if task.nil?
    idx = possible_tasks.index(task)
    p "Incorrect task type given: #{task}" and next if idx.nil? 

    annotations = Annotation.where(stage: Annotation::STAGES[idx + 1])
    count = 0
    CSV.open("results/" + file, "wb") do |csv|
      annotations.each do |annotation|
        csv << annotation.export
        if delete
          annotation.delete
          count=count+1
        end
      end
    end
    p "Written to results/#{file}"
    p "#{count} annotations deleted" if delete
  end

end