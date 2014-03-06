class Product < ActiveRecord::Base
	has_many :prices
	accepts_nested_attributes_for :prices
	has_many :stores, through: :prices

	validates :name, :brand, :price, :measure, :amount,presence: true
end
