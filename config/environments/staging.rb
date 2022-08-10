require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]
  config.logger = Logger.new(STDOUT)
end
