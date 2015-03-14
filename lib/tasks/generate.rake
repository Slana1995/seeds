namespace :db do
  desc "recreate database"
  task :recreate do
       Rake::Task[ 'db:reset' ].execute
  end
end