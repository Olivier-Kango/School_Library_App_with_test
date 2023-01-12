require './rental'
require 'json'

module RentalData
  def create_rental
    if !File.exist?('books.json')
      puts 'No Book is available in the Library'
    elsif !File.exist?('people.json')
      puts 'No Members Record is in the Library Database'
    else
      puts 'Select a Book from the list by index'
      books = File.read('books.json')
      books_data = JSON.parse(books)
      books_data.each_with_index do |book, index|
        puts "#{index.to_i + 1}) Book Title: #{book['title']}, Author: #{book['author']}"
      end
      rental_book = gets.chomp.to_i - 1
      puts

      puts 'Select a Person from the list by index'
      people = File.read('people.json')
      people_data = JSON.parse(people)
      people_data.each_with_index do |person, index|
        puts "#{index.to_i + 1}) Name: #{person['name']}, Age: #{person['age']}, ID: #{person['id']}"
      end
      rental_person = gets.chomp.to_i - 1
      puts

      puts 'Enter the Date :'
      date = gets.chomp
      puts

      rental_detail = Rental.new(date, books_data[rental_book], people_data[rental_person])
      @rentals << rental_detail
      save_rental_detail(rental_detail)
      puts 'Rental created'
    end
  end

  def list_of_rentals
    read_rental
  end

  def save_rental_detail(_rental_detail)
    rental_data = []

    @rentals.each do |rental_detail|
      rental_data << { date: rental_detail.date, book: rental_detail.book, person: rental_detail.person }
    end

    File.write('rentals.json', rental_data.to_json)
    # end
  end

  def read_rental_detail(rentals)
    if rentals == ''
      puts 'You need to Add rentals first !!!'
    else
      rental_data = JSON.parse(rentals)

      print 'Id of person: '
      id = gets.chomp.to_i
      person_arr = rental_data.select { |person| person['person']['id'].to_i == id }

      if person_arr.empty?
        puts 'No person matches the given ID!!'
      else
        person_arr.each do |rental|
          puts "Date: #{rental['date']}, Book: #{rental['book']['title']} by #{rental['person']['name']}"
        end
      end
    end
  end

  def read_rental
    if File.exist?('rentals.json')
      rentals = File.read('rentals.json')
      read_rental_detail(rentals)
    else
      puts 'No record regarding rental is available'
    end
  end
end
