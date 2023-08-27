require './Person.rb'

class Student < Person
  def initialize(name, age, parents_permission, classroom)
    super(name, age, parents_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end