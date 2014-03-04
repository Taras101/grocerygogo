class Product < ActiveRecord::Base
	has_many :prices
	has_many :stores
end
