require_relative '../book'

describe Book do
  before :each do
    @book = Book.new('Maa', 'Maxim Gorky')
  end

  describe '#new' do
    it 'retuns a new book object' do
      @book.should be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      @book.title.should eql 'Maa'
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      @book.author.should eql 'Maxim Gorky'
    end
  end
end
