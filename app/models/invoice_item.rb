class InvoiceItem < ActiveRecord::Base
  belongs_to :invoices
  belongs_to :item

  def total
    quantity * unit_price
  end
end
