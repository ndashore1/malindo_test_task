# frozen_string_literal: true

require 'email_generator'

# Handles task to find email based on first name, last name and url.
class EmailFinder < ApplicationService
  attr_reader :first_name, :last_name, :url

  # Initializes <tt>EmailFinder</tt> class.
  #
  # @param user_details [Hash]
  #
  # @return [void]
  def initialize(user_details)
    @first_name = user_details[:first_name]
    @last_name = user_details[:last_name]
    @url = user_details[:url]
  end

  # Finds email using MailBox API.
  # * return if one already exists in database.
  #
  # @return [UserInformation]
  def call
    user_information = UserInformation.find_or_initialize_by(
      first_name: first_name,
      last_name: last_name,
      url: url,
    )
    return user_information if user_information.persisted? || user_information.invalid?

    user_information.email = search_email
    user_information.save if user_information.valid?(:api_response)
    user_information
  end

  private

  # Searches for email using user information(ie. first name, last name and url).
  #
  # @return [String, NilClass]
  def search_email
    email = EmailGenerator.call(first_name, last_name, url).each do |email|
      break email if EmailValidator.valid?(email)
    end
    email if email.is_a?(String)
  end
end
