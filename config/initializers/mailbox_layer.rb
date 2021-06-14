# frozen_string_literal: true

# Initializes the MailBoxLayer API configuration.
Apilayer::Mailbox.configure do |configs|
  configs.access_key = ENV['API_KEY']
  configs.https = true
end
