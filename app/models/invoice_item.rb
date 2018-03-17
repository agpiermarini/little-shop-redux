class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item

  def total
    quantity * unit_price
  end
end
