class LittleShopApp < Sinatra::Base
  set :root, File.expand_path('..', __dir__)

  get '/' do
    erb :index
  end

  get '/merchants' do
    erb :merchants
  end
end
