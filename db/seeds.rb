require 'csv'
require './app/models/merchant'

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |row|
  Merchant.create(row.to_hash)
end
