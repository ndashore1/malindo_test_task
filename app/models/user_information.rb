# frozen_string_literal: true

# Manages User information details.
class UserInformation < ApplicationRecord
  validates :first_name, :last_name, :url, presence: true
  validates :url, format: { with: /\A(?!@)(\w+)\.(\w+)\z/i }, allow_blank: true
  validates :email, uniqueness: true
  validates :email, presence: { message: :not_found }, on: :api_response

  # Returns full name of user.
  #
  # @return [String]
  def full_name
    "#{first_name} #{last_name}"
  end
end
