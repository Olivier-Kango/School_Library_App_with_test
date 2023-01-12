require_relative '../capitalize_decorator'
require_relative '../person'

describe CapitalizeDecorator do
  context 'Capitalization of the first letters' do
    before :each do
      @person = Person.new(22, 'harisson', true)
      @capitalize_decorator = CapitalizeDecorator.new(@person)
    end

    it 'Capitalize the first letter' do
      expect(@capitalize_decorator.correct_name).to eq 'Harisson'
    end

    it 'Create a new capitalized decorator object' do
      expect(@capitalize_decorator).to be_instance_of CapitalizeDecorator
    end
  end
end
