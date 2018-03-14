require './app/controllers/little_shop_app'


describe 'Sinatra App' do
  # include Rack::Test::Methods

  def app
    LittleShopApp.new
  end

  it "should allow accessing the home page" do
    get '/'

    expect(last_response).to be_ok
  end

  it "should display welcome message" do
    get '/'

    expect(last_response.body).to include("Welcome!")
  end
end
