# frozen_string_literal: true

# Monkey patching String(in-built) class.
class String
  # Removes whitespaces from string.
  #
  # @return [String]
  def remove_whitespaces
    delete(" \t\r\n")
  end
end
