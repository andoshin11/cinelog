class ExampleJob < ActiveJob::Base
  def perform(*args)
    Rails.logger.debug('Hello, world!')
  end
end
