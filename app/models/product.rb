class Product < ActiveRecord::Base
	has_many :prices :through =>  :stores
	has_many :stores
end
