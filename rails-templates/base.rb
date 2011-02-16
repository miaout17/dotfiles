template_path = File.expand_path(File.join(__FILE__, '..'))

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

def ask_gem(name)
  gem name if yes?("Use #{name}?")
end

ask_gem 'inherited_resources'
ask_gem 'has_scope'
# ask_gem 'responders'

gem "rspec-rails", "~> 2.0.0", :group => [:development, :test]
gem "autotest", :group => [:development, :test]
gem "rcov", :group => [:development, :test]

# if yes?("Use awesome_print, hirb and wirble? [yn]", :cyan)
#   gem "awesome_print", :group => [:development, :test]
#   gem "hirb", :group => [:development, :test]
#   gem "wirble", :group => [:development, :test]
# end


# run "bundle" # Or generator may stuck :(

generate 'rspec:install'

application <<-EOS
  config.generators do |g|
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end
EOS

gsub_file('spec/spec_helper.rb', '/spec/fixtures', '/spec/factories')

# UJS
#Todo: automatically extract version?
run "rm public/javascripts/*"
%w{jquery-1.5.min rails}.each do |name|
  source = File.join(template_path, 'javascripts', "#{name}.js")
  target = "public/javascripts/#{name}.js"
  copy_file(source, target)
end
create_file("public/javascripts/#{app_name}.js", "")
gsub_file 'config/application.rb',
  /# config.action_view.javascript_expansions.*/,
  "config.action_view.javascript_expansions[:defaults] = %w(jquery-1.5.min rails #{app_name})"

copy_file(File.join(template_path, 'tasks/dev.rake'), "lib/tasks/dev.rake")

git :init
git :add => "."
git :commit => "-m 'initial commit'"

