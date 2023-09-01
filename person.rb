require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name, parents_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parents_permission = parents_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parents_permission
  end

  def add_rental(rental)
    @rentals << rental
  end

  private

  def of_age?
    @age && @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
# output: Maximilianus

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
# output: Maximilian
