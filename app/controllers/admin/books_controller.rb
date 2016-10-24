class Admin::BooksController < ApplicationController
	before_action :signed_in_user

	def index
		@books = Book.get_all_books
		@book = Book.new
	end

	def edit
		@book = Book.get_book(params[:id])
	end

	def update
		@book = Book.get_book(params[:id])
		if @book.update(book_params)
			redirect_to :back
		end
	end

	def create
		data_create = book_params.merge(:created_by => session[:user_id])
		book = Book.create_book(data_create)

		if book.save
			redirect_to admin_books_path
		else
			abort 'Have some errors'
		end
	end

	def destroy

	end

	private
		def book_params
			params.require(:book).permit(:img_path,:title,:author,:description)
		end

end
