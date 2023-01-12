require_relative '../person'

describe Person do
  before :each do
    @person = Person.new(12, 'Rose', true)
  end

  describe '#new' do
    it 'retuns a new person object' do
      @person.should be_an_instance_of Person
    end
  end

  describe '#age' do
    it 'returns the correct age' do
      @person.age.should eql 12
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      @person.name.should eql 'Rose'
    end
  end

  context 'can_use_services?' do
    it 'return the correct name' do
      correct_name = @person.correct_name
      expect(correct_name).to eq 'Rose'
    end
  end
end
