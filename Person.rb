class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name='Unknown', age, parents_permission=true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  private def of_age?
    if @age >= 18
      true
    else
      false
    end
  end

  def can_use_services?
    of_age? || @parents_permission
  end

end