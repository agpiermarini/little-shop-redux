class InvoiceItem < ActiveRecord::Base
  belongs_to :invoices
  belongs_to :items
end
