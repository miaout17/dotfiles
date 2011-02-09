puts "Running .irbrc"

if ($0 == 'irb' && ENV['RAILS_ENV']) || (($0 == 'script/rails' || $0 =~ /richrc$/) && Rails.env)

  puts ".irbrc => Rails"

  # ActiveRecord.module_eval do
  def ar_log(show)
    ActiveRecord::Base.logger = Logger.new(show ? STDOUT : nil)
    nil
  end

  # Use `richrc` gem instead :)
  # begin
  #   require 'wirble'
  #   Wirble.init
  #   Wirble.colorize
  # rescue LoadError
  #   puts "Wirble is not loaded!!"
  # end

  # begin
  #   require 'hirb'
  #   Hirb.enable
  # rescue LoadError
  #   puts "Hirb is not loaded!!"
  # end

end

