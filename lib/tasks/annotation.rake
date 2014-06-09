namespace :annotation do

  desc 'delete completed annotations'
  task :delete_completed => :environment do
    count = Annotation.delete_all(stage: Annotation::STAGES[:complete])
    p "#{count} annotations deleted"
  end

end