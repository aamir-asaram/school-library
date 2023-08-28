require './Person.rb'

class Student < Person
  def initialize(age, classroom, parents_permission: true, name: 'Unknown')
    super(age, parents_permission: parents_permission, name: name)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
