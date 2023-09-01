require './person'
require './student'
require './classroom'
require './book'
require './rental'
require './teacher'
require './capitalize_decorator'
require './trimmer_decorator'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @people << Student.new(17, Classroom.new('CS'), 'Maximilianus', true)
    @people << Student.new(18, Classroom.new('CS'), 'John', true)
    @books << Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
    @books << Book.new('The Hobbit', 'J. R. R. Tolkien')
  end

  def list_people(index = false)
    if index
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      @people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
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
      print 'Specialization: '
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

  def list_books(index = false)
    if index
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    puts ''
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books(true)
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_people(true)
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @people.each do |person|
      next unless person.id == id

      person.rentals.each do |rental|
        puts rental
      end
    end
    puts ''
  end
end
