require './person'
require './student'
require './classroom'
require './book'
require './rental'
require './classroom'
require './teacher'
require './capitalize_decorator'
require './trimmer_decorator'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.each { |book| puts book.title }
  end

  def list_people
    @people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    puts ''
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    if person_type == 1
      classroom = Classroom.new('CS')
      print 'Parents permission? [Y/N] '
      parents_permission = gets.chomp.downcase == 'y'
      student = Student.new(age, classroom, name, parents_permission)
      @people << student
    elsif person_type == 2
      puts 'Specialization?'
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name)
      @people << teacher
    else
      puts 'Invalid option'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
  end

  def list_books
    @books.each { |book| puts "#{book.title} by #{book.author}" }
    puts ''
  end

end
