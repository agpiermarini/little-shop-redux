class InvoiceItem < ActiveRecord::Base
  belongs_to :invoices
  belongs_to :items

  def total
    quantity * unit_price
  end
end
