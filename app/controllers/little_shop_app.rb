class LittleShopApp < Sinatra::Base
  set :root, File.expand_path('..', __dir__)

  get '/' do
    erb :index
  end

  get '/merchants' do
    erb :'merchants/index',
        :locals => {
          :all_merchants => Merchant.all
        }
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  post '/merchants' do
    Merchant.create(params[:merchant])

    redirect '/merchants'
  end

  get '/merchants/:id/edit' do
    erb :'merchants/edit',
        :locals => {
          :merchant => Merchant.find(params[:id])
        }
  end

  post '/merchants/:id' do
    Merchant.find(params[:id]).update(params[:merchant])

    redirect '/merchants'
  end
end
