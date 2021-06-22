# frozen_string_literal: true

# Abstract class of model.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
