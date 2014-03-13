class GroceryItem < ActiveRecord::Base
	belongs_to :user
	acts_as_list scope: :user
	default_scope :order => :position
	def self.search(search)
	  if search
	    find(:all, :conditions => ['LOWER(name) LIKE ?', "%#{search.downcase}%"])
	  else
	    find(:all)
	  end
	end
end
