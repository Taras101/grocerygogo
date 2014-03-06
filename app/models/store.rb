class Store < ActiveRecord::Base
	has_many :products, through: :prices
	has_many :prices

	def self.available_stores
	end

end
