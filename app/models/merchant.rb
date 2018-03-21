class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  validates :name, presence: true

  include WillPaginate::Sinatra::Helpers

  def item_count
    items.count
  end

  def average_item_price
    return 'N/A' if items.first.nil?
    items.average('price').round(2)
  end

  def total_item_cost
    items.sum('price')
  end

  def self.most_items
    select("COUNT(items.id) AS item_count, merchants.id, merchants.name")
    .joins(:items)
    .group("merchants.id")
    .order("item_count DESC")
    .first
  end

  def self.highest_price_item
    select("MAX(items.price) AS most_expensive, merchants.id, merchants.name")
    .joins(:items)
    .group(:id)
    .order("most_expensive DESC")
    .first
  end

  def index
    @merchants = Merchant.paginate(page: params[:page], per_page: 30)
    respond_to do |format|
      format.html
      format.json { render json: @merchants }
    end
  end
end
