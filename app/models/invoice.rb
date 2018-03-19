class Invoice < ActiveRecord::Base
  belongs_to :merchant
  has_many   :invoice_items
  has_many   :items, through: :invoice_items

  validates :merchant_id, presence: true
  validates :status, presence: true

  def total
    invoice_items.sum('quantity * unit_price')
  end

  def delimited_total(number = total)
    string = number.to_s.reverse.scan(/.{1,3}/)
    string.join(',').reverse
  end

  def self.status_percentage(hash)
    (where(hash).count / count.to_f * 100).round
  end

  def self.highest_unit_price
    joins(:invoice_items).order("invoice_items.unit_price").last
  end

  def self.lowest_unit_price
    joins(:invoice_items).order("invoice_items.unit_price").first
  end

  def self.highest_quantity
    joins(:invoice_items).order("invoice_items.quantity").last

  end

  def self.lowest_quantity
    joins(:invoice_items).order("invoice_items.quantity").first
  end
end
