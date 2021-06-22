# frozen_string_literal: true

FactoryBot.define do
  factory :user_information do
    first_name { 'john' }
    last_name { 'doe' }
    url { '8returns.com' }
    email { 'johndoe@8returns.com' }
  end
end
