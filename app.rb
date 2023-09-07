require './person'
require './student'
require './classroom'
require './book'
require './rental'
require './teacher'
require './capitalize_decorator'
require './trimmer_decorator'
require 'json'

class App
  def initialize
    @people = []
    if File.exist?('people.json') && File.size('people.json') > 0
      JSON.parse(File.read('people.json')).each do |person|
        if person['type'] == 'Student'
          student = Student.new(person['age'], person['name'], parents_permission: person['parents_permission'])
          student.instance_variable_set(:@id, person['id'])
          @people << student
        elsif person['type'] == 'Teacher'
          teacher = Teacher.new(person['age'], person['specialization'], person['name'])
          teacher.instance_variable_set(:@id, person['id'])
          @people << teacher
        end
      end
    end
    @books = []
    if File.exist?('books.json') && File.size('books.json') > 0
      JSON.parse(File.read('books.json')).each do |book|
        @books << Book.new(book['title'], book['author'])
      end
    end
    @rentals = []
    if File.exist?('rentals.json') && File.size('rentals.json') > 0
      JSON.parse(File.read('rentals.json')).each do |rental|
        book = @books.find { |book| book.title == rental['book']['title'] }
        person = @people.find { |person| person.id == rental['person']['id'] }
        @rentals << Rental.new(rental['date'], book, person )
      end
    end
  end

  def list_people(index: false)
    @people.each_with_index do |person, idx|
      print "#{idx + 1} - " if index
      if person.class == Student
        print "[#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}, Index: #{index}, Parents permission: #{person.parents_permission}\n"
      elsif person.class == Teacher
        print "[#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}, Index: #{index}, Specialization: #{person.specialization}\n"
      end
    end
    puts ''
  end

  def write_to_file
    people = []
    File.open('people.json', 'w') do |file|
      @people.each do |person|
        if person.class == Student
          hash = {type: 'Student', age: person.age, name: person.name, parents_permission: person.parents_permission, id: person.id}
        elsif person.class == Teacher
          hash = {type: 'Teacher', age: person.age, name: person.name, specialization: person.specialization, id: person.id}
        end
        people.push(hash)
      end
      file.write(people.to_json)
    end
    books = []
    File.open('books.json', 'w') do |file|
      @books.each do |book|
        hash = {title: book.title, author: book.author}
        books.push(hash)
      end
      file.write(books.to_json)
    end
    rentals = []
    File.open('rentals.json', 'w') do |file|
      @rentals.each do |rental|
        hash = {date: rental.date, person: {name: rental.person.name, id: rental.person.id}, book: {title: rental.book.title, author: rental.book.author}}
        rentals.push(hash)
      end
      file.write(rentals.to_json)
    end
  end

  def create_person(person_type)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    if person_type == 1
      print 'Parents permission? [Y/N] '
      parents_permission = gets.chomp.downcase == 'y'
      student = Student.new(age, name, parents_permission: parents_permission)
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

  def list_books(index: false)
    @books.each_with_index do |book, idx|
      print "#{idx + 1} - " if index
      print "Title: #{book.title}, Author: #{book.author}\n"
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

  def list_rentals(id)
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
