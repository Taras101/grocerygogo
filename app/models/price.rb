class Price < ActiveRecord::Base
	belongs_to :store
	belongs_to :product
		validates :price, :measure, :amount ,presence: true
end
