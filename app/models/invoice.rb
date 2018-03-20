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

    # RETURNS INVOICE ASSOCIATED WITH HIGHEST TOTAL UNIT_PRICE
    # joins(:invoice_items)
    # .select("invoices.id, sum(invoice_items.unit_price) AS total_unit_price")
    # .group(:id)
    # .order("total_unit_price")
    # .last

    # RETURNS INVOICE ASSOCIATED WITH HIGHEST TOTAL CHARGES
    # joins(:invoice_items)
    # .select("invoices.id, sum(invoice_items.unit_price * invoice_items.quantity) AS total_charges")
    # .group(:id)
    # .order("total_charges")
    # .last
  end

  def self.lowest_unit_price
    joins(:invoice_items).order("invoice_items.unit_price").first

    # RETURNS INVOICE ASSOCIATED WITH LOWEST TOTAL UNIT PRICE
    # joins(:invoice_items)
    # .select("invoices.id, sum(invoice_items.unit_price) AS total_unit_price")
    # .group(:id)
    # .order("total_unit_price")
    # .first

    # RETURNS INVOICE ASSOCIATED WITH LOWEST TOTAL CHARGES
    # joins(:invoice_items)
    # .select("invoices.id, sum(invoice_items.unit_price * invoice_items.quantity) AS total_charges")
    # .group(:id)
    # .order("total_charges")
    # .first
  end

  def self.highest_quantity
    joins(:invoice_items)
    .select("invoices.id, sum(invoice_items.quantity) AS total_quantity")
    .group(:id)
    .order("total_quantity")
    .last
    # joins(:invoice_items).order("invoice_items.quantity").last
  end

  def self.lowest_quantity
    joins(:invoice_items)
    .select("invoices.id, sum(invoice_items.quantity) AS total_quantity")
    .group(:id)
    .order("total_quantity")
    .first
    # joins(:invoice_items).order("invoice_items.quantity").first
  end
end
