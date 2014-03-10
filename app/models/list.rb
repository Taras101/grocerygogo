class List < ActiveRecord::Base
	def self.search(search)
	  if search
	    find(:all, :conditions => ['LOWER(name) LIKE ?', "%#{search.downcase}%"])
	  else
	    find(:all)
	  end
	end
end
