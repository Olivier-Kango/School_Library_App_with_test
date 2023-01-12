require_relative '../rental'

describe Rental do
  before :each do
    @rental = Rental.new('01/11/2023', 'Maxim', 'Gorky')
  end

  describe '#new' do
    it 'retuns a new rental object' do
      @rental.should be_an_instance_of Rental
    end
  end

  describe '#book' do
    it 'returns the book title' do
      @rental.book.should eql 'Maxim'
    end
  end

  describe '#person' do
    it 'returns the name' do
      @rental.person.should eql 'Gorky'
    end
  end
end
