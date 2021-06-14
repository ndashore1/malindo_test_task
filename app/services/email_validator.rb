# frozen_string_literal: true

# Handles API task to validate email using MailBox API.
class EmailValidator
  # Verifies if email is valid and exists.
  #
  # @param email [String]
  #
  def self.valid?(email)
    response =
      begin
        Apilayer::Mailbox.check(email)
      rescue Faraday::ConnectionFailed, Faraday::TimeoutError, Apilayer::Error, StandardError => e
        { status: e.try(:code) }
      end
    return false if response.key?(:status)

    response.slice('format_valid', 'mx_found', 'smtp_check').values.all?
  end
end
