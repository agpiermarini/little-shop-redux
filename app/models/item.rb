class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many   :invoice_items

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true

  def self.newest_item
    order(created_at: :desc).first.title
  end

  def self.oldest_item
    order(:created_at).first.title
  end
end
