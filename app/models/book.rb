class Book < ActiveRecord::Base
	belongs_to :user, foreign_key: 'created_by'

	mount_uploader :img_path, ImageUploader

	def self.get_all_books
		Book.all
	end

	def self.get_book(book_id)
		book = self.find(book_id)
	end

	def self.create_book(data_create)
		book = self.new(data_create)
	end

	def self.update_book(book_id, data_update)
		book = self.find(book_id)
		if book.update(data_update)
			return book
		else
			return false
		end
	end


end
