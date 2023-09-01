# frozen_string_literal: true

class Nameable
  def correct_name
    NotImplementedError.new('You must implement the correct_name method')
  end
end
