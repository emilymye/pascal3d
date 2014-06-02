require 'csv'

namespace :import do

  desc "Imports CSV file of images into database - usage import:images['<file.csv>']"
  task :images, [ :file ] => :environment do |t, args|
    raise "Error: no csv file of images specified" unless args.has_key?(:file)
    cnt = 0
    
    categories = Category.all.map(&:name)
    CSV.foreach(args[:file]) do |row|
      img = Image.find_or_initialize_by(:filepath => row[0])
      if img.new_record?
        catname = row[1]
        if categories.include?(catname)
          img.category_name = catname
          img.save
          cnt = cnt + 1
          p "Creating new #{catname} image #{row[0]}"
        else
          p "Error: #{catname} is invalid category"
        end
      end
    end
    p "Created #{cnt} new Image rows"
  end




  
end