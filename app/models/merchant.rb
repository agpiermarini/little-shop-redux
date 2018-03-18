class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  validates :name, presence: true

  def item_count
    items.count
  end

  def self.most_items
  end

  def self.highest_price_item
  end
end
