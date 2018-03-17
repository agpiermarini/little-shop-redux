require 'csv'
require './app/models/merchant'
require './app/models/item'

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |row|
  Merchant.create(id:         row[:id],
                  name:       row[:name],
                  created_at: row[:created_at],
                  updated_at: row[:updated_at])
end

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |row|
  Item.create(id:          row[:id],
              title:       row[:name],
              description: row[:description],
              price:       row[:unit_price],
              image:       'file:///Users/haleymesander/Pictures/Snip20180316_1.png',
              merchant_id: row[:merchant_id],
              created_at:  row[:created_at],
              updated_at:  row[:updated_at])
end
