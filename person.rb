require './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, parents_permission: true, name: 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parents_permission = parents_permission
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parents_permission
  end

  private

  def of_age?
    @age && @age >= 18
  end
end
