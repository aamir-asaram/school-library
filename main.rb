require './app'

def display_menu
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  gets.chomp.to_i
end

def run_method(option, app)
  case option
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    app.create_person(person_type)
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    print 'ID of person: '
    id = gets.chomp.to_i
    app.list_rentals(id)
  else
    puts 'Invalid option'
  end
  display_menu
end

puts 'Welcome to School Library app!'
option = display_menu
app = App.new
option = run_method(option, app) while option != 7
puts 'Thanks for using the School Library app!'
app.write_to_file
