class Product < ActiveRecord::Base
	has_many :prices
	has_many :stores, through: :prices
	accepts_nested_attributes_for :prices, :stores
	validates :name, :brand,presence: true
end
