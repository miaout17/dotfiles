puts "Running .irbrc"

require 'rubygems' # for 1.8.x

begin
  gem 'wirble'
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError
  puts "Failed to load wirble"
end unless defined? Wirble

begin
  gem 'hirb'
  require 'hirb'
  Hirb.enable
rescue LoadError
  puts "Failed to load hirb"
end unless defined? Hirb

IRB.conf[:PROMPT][:CUSTOM] = {
  :PROMPT_I => "\e[1;31mIRB\e[m> ",
  :PROMPT_N => "INDENT > ",
  :PROMPT_S => "STRING > ",
  :PROMPT_C => "CONT   > ",
  :RETURN => "=> %s\n"
}
IRB.conf[:PROMPT_MODE] = :CUSTOM

if ($0 == 'irb' && ENV['RAILS_ENV']) || (($0 == 'script/rails' || $0 =~ /richrc$/) && Rails.env)
  IRB.conf[:PROMPT][:CUSTOM][:PROMPT_I] = "[\e[36m#{Rails.env.capitalize}\e[0m] \e[1;31mIRB\e[m> "

  def ar_log(show=true)
    ActiveRecord::Base.logger = Logger.new(show ? STDOUT : nil)
    nil
  end

  def dm_log
    DataMapper::Logger.new($stdout, :debug)
    nil
  end
  # IRB.conf[:AUTO_INDENT] = true # ANSI code breaks indention!!
end
