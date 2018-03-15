class LittleShopApp < Sinatra::Base
  set :root, File.expand_path('..', __dir__)

  get '/' do
    erb :index
  end

  get '/merchants' do
    erb :merchants,
        :locals => {
          :all_merchants => Merchant.all
        }

  end
end
