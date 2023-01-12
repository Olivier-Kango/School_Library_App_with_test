require_relative '../trimmer_decorator'
require_relative '../person'

describe TrimmerDecorator do
  context 'Following is the instance of trimmer decorator' do
    before :each do
      @person = Person.new(22, 'albert einstein', true)
      @trimmer_decorator = TrimmerDecorator.new(@person)
    end

    it 'create a new object using Trimmer Decorator' do
      expect(@trimmer_decorator).to be_instance_of(TrimmerDecorator)
    end

    it 'Trim words' do
      expect(@trimmer_decorator.correct_name).to eql 'albert ein'
    end
  end
end
