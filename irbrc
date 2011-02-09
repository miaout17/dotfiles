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

IRB.conf[:PROMPT][:CUSTOM] = {
  :PROMPT_I => "\e[1;31mIRB\e[m> ",
  :PROMPT_N => "INDENT > ",
  :PROMPT_S => "STRING > ",
  :PROMPT_C => "CONT   > ",
  :RETURN => "=> %s\n"
}
IRB.conf[:PROMPT_MODE] = :CUSTOM

if ($0 == 'irb' && ENV['RAILS_ENV']) || (($0 == 'script/rails' || $0 =~ /richrc$/) && Rails.env)
  puts ".irbrc => Rails"

  IRB.conf[:PROMPT][:CUSTOM][:PROMPT_I] = "[\e[36m#{Rails.env.capitalize}\e[0m] \e[1;31mIRB\e[m> "

  # ActiveRecord.module_eval do
  def ar_log(show=true)
    ActiveRecord::Base.logger = Logger.new(show ? STDOUT : nil)
    nil
  end

  # IRB.conf[:AUTO_INDENT] = true # ANSI code breaks indention!!

end
