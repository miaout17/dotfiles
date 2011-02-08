if ($0 == 'irb' && ENV['RAILS_ENV']) || ($0 == 'script/rails' && Rails.env)
  ActiveRecord.module_eval do
    def self.show_log
      ActiveRecord::Base.logger = Logger.new(STDOUT)
      nil
    end
    def self.hide_log
      ActiveRecord::Base.logger = Logger.new(nil)
      nil
    end
  end
end

