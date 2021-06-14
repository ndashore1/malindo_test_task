# frozen_string_literal: true

# Handles task to generate emails.
class EmailGenerator
  # Invokes call to generate custom Email using users first name, last name and url.
  #
  # @param first_name [String] FirstName
  # @param last_name [String] LastName
  # @param url [String] URL
  #
  # @return [Array] email generator.
  def self.call(first_name, last_name, url)
    prefixes = [
      "#{first_name}.#{last_name}",
      first_name.to_s,
      "#{first_name}#{last_name}",
      "#{last_name}.#{first_name}",
      "#{first_name&.chr}.#{last_name}",
      "#{first_name&.chr}#{last_name&.chr}",
    ]
    prefixes.map { |prefix| "#{prefix}@#{url}".downcase.remove_whitespaces }
  end
end
