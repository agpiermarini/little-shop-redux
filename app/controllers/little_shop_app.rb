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
    Merchant.update(params[:id], params[:merchant])

    redirect '/merchants'
  end

  delete '/merchants/:id' do
    Merchant.destroy(params[:id])

    redirect '/merchants'
  end

  get '/invoices' do
    erb :'invoices/index',
        :locals => {
          :all_invoices => Invoice.all
        }
  end

  get '/invoices/:id/edit' do
    erb :'invoices/edit',
        :locals => {
          :invoice => Invoice.find(params[:id])
        }
  end

  get '/invoices/:id' do
    erb :'invoices/show',
        :locals => {
          :invoice => Invoice.find(params[:id])
          # :merchant => Merchant.find(Invoice.find(params[:id]).merchant_id)     # is this what we're supposed to do?
        }
  end

  delete '/invoices/:id' do
    Invoice.destroy(params[:id])

    redirect '/invoices'
  end

  get '/items' do
    erb :'items/index',
        :locals => {
          :all_items => Item.all
        }
  end

  get '/items/new' do
    erb :'items/new'
  end

  delete '/items/:id' do
    Item.destroy(params[:id])

    redirect '/items'
  end

  get '/items/:id' do
    erb :'items/show',
        :locals => {
          :item => Item.find(params[:id])
        }
  end

  get '/items/:id/edit' do
    erb :'items/edit',
        :locals => {
          :item => Item.find(params[:id]),
          :all_merchants => Merchant.all
        }
  end

  post '/items/:id' do
    Item.update(params[:id], params[:update])
    require 'pry' ; binding.pry
    redirect '/items'
  end


end
