require './person'

class Student < Person
  def initialize(age, classroom, parents_permission: true, name: 'Unknown')
    super(age, parents_permission: parents_permission, name: name)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
