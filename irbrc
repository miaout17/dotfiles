puts "Running .irbrc"

require 'rubygems' # for 1.8.x

begin
  gem 'wirble'
  require 'wirble'
  Wirble.init
  Wirble.colorize
  puts "Wirble is loaded!!"
rescue LoadError
  puts "Wirble is not loaded!!"
end unless defined? Wirble

begin
  gem 'hirb'
  require 'hirb'
  Hirb.enable
  puts "Hirb is loaded!!"
rescue LoadError
  puts "Hirb is not loaded!!"
end unless defined? Hirb

if ($0 == 'irb' && ENV['RAILS_ENV']) || (($0 == 'script/rails' || $0 =~ /richrc$/) && Rails.env)
  puts ".irbrc => Rails"

  # ActiveRecord.module_eval do
  def ar_log(show=true)
    ActiveRecord::Base.logger = Logger.new(show ? STDOUT : nil)
    nil
  end

  IRB.conf[:PROMPT][:CUSTOM] = {
   :PROMPT_N => "[#{Rails.env.capitalize}]>> ",
   :PROMPT_I => "[#{Rails.env.capitalize}]>> ",
   :PROMPT_S => "STR> ",
   :PROMPT_C => "???> ",
   :RETURN => "=> %s\n"
   }
  IRB.conf[:PROMPT_MODE] = :CUSTOM
  IRB.conf[:AUTO_INDENT] = true

end
