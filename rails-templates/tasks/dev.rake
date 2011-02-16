namespace :dev do
  desc "Rebuild the database and create seed data"
  task :build => ['db:drop', 'db:create', 'db:migrate', 'db:seed'] do
  end

  desc "Generate fake data"
  task :fake => ['environment'] do
    # Add your fake data here :)
  end

  desc "Rebuild database and generate fake data"
  task :refake => ['build', 'dev:fake'] do
  end

end
