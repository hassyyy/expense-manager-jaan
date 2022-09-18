require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Prepend all log lines with the following tags.
  logger           = ActiveSupport::Logger.new(STDOUT)
  logger.formatter = config.log_formatter
  config.logger    = ActiveSupport::TaggedLogging.new(logger)
  config.log_tags = [ :request_id ]
end
