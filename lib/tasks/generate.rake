namespace :raketask do
  desc "recreate database"
  task :recreate do
       Rake::Task[ 'db:reset' ].execute
  end
  desc "export csv"
  task :csv => :environment do
      require 'csv'
      CSV.open("mailer.csv", "w") do |csv|
        @authors = Author.all.uniq # your query here
        csv << ['name', 'email']  #column head of csv file
        @authors.each do |author|
        csv << [author.name, author.email] #fields name
        end
      end
    end
end