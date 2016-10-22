class Admin::BooksController < ApplicationController
	before_action :signed_in_user
	before_action :verify_admin

	def index
		@books = Book.get_all_books
	end

	def edit

	end

	def update

	end

	def create

	end

	def destroy

	end

end
