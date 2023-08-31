require './person'

class Student < Person
  def initialize(age, classroom, parents_permission: true, name: 'Unknown')
    super(age, parents_permission: parents_permission, name: name)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
