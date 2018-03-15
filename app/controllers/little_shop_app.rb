class LittleShopApp < Sinatra::Base
  set :root, File.expand_path('..', __dir__)
  set :method_override, true

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

  get '/merchants/:id' do
    erb :'merchants/show',
        :locals => {
          :merchant => Merchant.find(params[:id])
        }
  end

  post '/merchants/:id' do
    Merchant.find(params[:id]).update(params[:merchant])

    redirect '/merchants'
  end

  delete '/merchants/:id' do
    Merchant.destroy(params[:id])

    redirect '/merchants'
  end

end
