class BooksController < ApplicationController
	before_action :signed_in_user
	before_action :generate_categories

	def index
		@books = Book.get_all_books
	end

	def show
		
	end
end
