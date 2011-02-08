run "cp config/database.yml config/database.yml.example"
run "rm .gitignore"

file ".gitignore", <<-EOS
.bundle
log/*.log
tmp/**/*
db/*.sqlite3
config/database.yml
EOS

#TODO: dev only?
gem "rails3-generators"
gem "factory_girl_rails"
gem "faker"

gem "rspec-rails", "~> 2.0.0", :group => [:development, :test]
gem "autotest", :group => [:development, :test]
gem "rcov", :group => [:development, :test]

if yes?("Use awesome_print, hirb and wirble? [yn]", :cyan)
  gem "awesome_print", :group => [:development, :test]
  gem "hirb", :group => [:development, :test]
  gem "wirble", :group => [:development, :test]
end

# run "bundle" # Or generator may stuck :(

generate 'rspec:install'

application <<-EOS
  config.generators do |g|
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end
EOS

gsub_file('spec/spec_helper.rb', '/spec/fixtures', '/spec/factories')

git :init
git :add => "."
git :commit => "-m 'initial commit'"

