require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Prepend all log lines with the following tags.
  config.logger = Logger.new(STDOUT)
end
