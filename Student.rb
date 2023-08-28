require './Person.rb'

class Student < Person
  def initialize(parents_permission, classroom)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
