require_relative '../app'

describe App do
  before(:each) do
    @app = App.new
  end

  it 'sould run' do
    expect(@app).to_not be_nil
  end

  it 'should display' do
    expect(@app.display_list).to respond_to(:length)
  end
end
