require './people_data'
require './rentals_data'
require './book_data'

class App
  include BookData
  include PeopleData
  include RentalData

  attr_accessor :books, :people, :rentals

  def initialize
    @list = {
      '1' => 'List of All Books',
      '2' => 'List of All Peoples',
      '3' => 'Create a Person',
      '4' => 'Create a Book',
      '5' => 'Create a Rental',
      '6' => 'List of All Rentals for a person ID',
      '7' => 'Quit'
    }

    @books = []

    @people = []

    @rentals = []
  end

  def display_list
    @list.each do |key, value|
      puts "#{key} - #{value}"
    end
  end

  def choose_options(option)
    case option
    when 1 then list_of_books
    when 2 then list_of_people
    when 3 then student_or_teacher
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_of_rentals
    end
  end

  def choose_options_and_exit
    option = gets.chomp.to_i

    if option == 7
      puts 'Please come again to visit the Library'
      puts
      exit
    else
      choose_options(option)
    end
  end

  def run
    display_list
    choose_options_and_exit
    puts
  end
end
