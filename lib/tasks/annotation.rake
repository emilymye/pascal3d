namespace :annotation do

  desc 'delete completed annotations'
  task :delete_completed => :environment do
    count = Annotation.delete_all(stage: Annotation::STAGES[:complete])
    p "#{count} annotations deleted"
  end


  desc 'export all completed annotations'
  task :export, [:filename, :delete_record] => :environment do |t,args|
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
end