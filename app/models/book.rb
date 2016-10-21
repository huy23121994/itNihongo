class Book < ActiveRecord::Base

	def self.get_all_books
		Book.all
	end

end
