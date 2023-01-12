require './book'
require 'json'

module BookData
  def list_of_books
    read_book_data
  end

  def create_book
    print 'Title of the Book is: '
    title = gets.chomp

    print 'Author of the Book is: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    save_book_data(book)

    puts 'Book Information entered successfully!!!'
  end

  def save_book_data(_book)
    data = []

    @books.each do |book|
      data << { title: book.title, author: book.author }
    end

    File.write('books.json', data.to_json)
  end

  def read_book_data
    if File.exist?('./books.json')
      books = File.read('./books.json')

      if books == ''
        puts 'You need to Add books first !!!'
      else
        book_data = JSON.parse(books)
        book_data.each do |book|
          puts "Title: #{book['title']}, Author: #{book['author']}"
        end
      end
    else
      puts 'Books are not available'
    end
  end
end
