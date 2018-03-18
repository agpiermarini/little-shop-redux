class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  validates :name, presence: true

  def item_count
    items.count
  end

  def average_item_price
    items.average('price')
  end

  def total_item_cost
    items.sum('price')
  end

  def self.most_items
  end

  def self.highest_price_item
  end
end
