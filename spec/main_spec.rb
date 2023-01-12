require_relative '../app'

describe App do
  context 'when runing ruyby main.rb' do
    it 'sould display' do
      app = App.new.display_list
      expect(app).to respond_to(:length)
    end
  end
end
