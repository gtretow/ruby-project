class ApplicationJob < ActiveJob::Base
  queue_as :default

  def perform()
    puts Time.now.utc
  end

end
