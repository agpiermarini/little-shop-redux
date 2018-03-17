class Item < ActiveRecord::Base
  belongs_to :merchant

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
