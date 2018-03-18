class Invoice < ActiveRecord::Base
  belongs_to :merchant
  has_many   :invoice_items
  has_many   :items, through: :invoice_items

  validates :merchant_id, presence: true
  validates :status, presence: true

  def total
    number = invoice_items.sum { |inv_item| inv_item.total }
  end

  def delimited_total(number = total)
    string = number.to_s.reverse.scan(/.{1,3}/)
    string.join(",").reverse
  end
end
