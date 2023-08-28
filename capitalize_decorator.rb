require './decorator'

class CapitalizeDecorator < Decorator
  initialize(nameable)
    super(nameable)
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end
