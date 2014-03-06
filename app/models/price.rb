class Price < ActiveRecord::Base
	belongs_to :store
	belongs_to :product
	validates :price, :measure, :amount ,presence: true
	scope :current, -> {where("valid_from < ? and valid_to > ?", Time.now, Time.now)}

	def formatted_price
    price_in_dollars = price.to_f / 100
    sprintf("%.2f", price_in_dollars)
  end
end
