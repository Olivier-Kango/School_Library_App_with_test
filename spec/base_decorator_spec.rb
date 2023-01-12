require_relative '../base_decorator'

describe BaseDecorator do
  context 'The Base Decorator is here' do
    before :each do
      @base_decorator = BaseDecorator.new('Dennis')
    end

    it 'A new Base decorator is created' do
      expect(@base_decorator).to be_instance_of BaseDecorator
    end
  end
end
