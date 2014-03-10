class Product < ActiveRecord::Base
	has_many :prices
	has_many :stores, through: :prices
	accepts_nested_attributes_for :prices, :stores
	validates :name, :brand,presence: true


	def self.search(search, store = nil)
	 	#prices = Price.current.includes(:product)

	  unless search.blank?
	  	if store
	  		puts "aaaaa"
		    Price.current
		    			.includes([:product, :store])
		    			.where('LOWER(products.name) LIKE ?', "%#{search.downcase}%")
		    			.where(:store => store)
		    			.references(:products)
	  	else
	  		puts 'bbbbbbbb'
		    Price.current.includes([:product])
		    						 .where('LOWER(products.name) LIKE ?', "%#{search.downcase}%")
		    						 .references([:products])
	  	end
	  else
	  	if store
	  		puts "cccccccccc"
		    Price.current.includes([:product, :store])
		    						 .where(:store => store)
	  	else
	  		puts "ddddddddddd"
		    Price.current.includes(:product)
	  	end
	  end
	end
end
