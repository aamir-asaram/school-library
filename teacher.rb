require './Person.rb'

class Teacher < Person
  def initialize(age, specialization, parents_permission: true, name: 'Unknown')
    super(age, parents_permission: parents_permission, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end