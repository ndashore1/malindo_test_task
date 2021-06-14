# frozen_string_literal: true

# Base class of services.
class ApplicationService
  # Constructor to initialize object and invoke #call method of service.
  #
  # @param args [Hash]
  # @yieldparam [optional]
  #
  # @return [void]
  def self.call(...)
    new(...).call
  end
end
