class FrontEndController < ApplicationController
  before_action :generate_categories

  def index
    # @posts = custom_paginate(Post.all)
    @newest_books = Book.get_books(4)
  end

  def category
  	category = Category.get_category_by_slug(params[:slug])
  	# @books = custom_paginate(category.books)
    @books = category.books
    @category = category.category
  	render 'list_books'
  end

  def tag
    tag = Tag.find_by(slug: params[:slug])
    @posts = custom_paginate(tag.posts)
    render 'index'
  end

  def show_book
    book_slug = params[:slug]
    @book = Book.get_book_by_slug(book_slug)
    @categories = @book.categories
    @book = Book.find_by(slug: params[:slug])
    if signed_in?
      @review = current_user.reviews.build
    end
    @reviews = @book.reviews.paginate(page: params[:page])
    render 'show_book'
  end

  def all_book
    @books = Book.get_all_books()
    @category = 'Tất cả các sách'
    render 'list_books'
  end

  def search_book
  	@books = Book.search_title(params[:query])
    @category = 'Danh sách tìm kiếm'
    render 'list_books'
  end
  
  def check_in_book
    if params[:type] == 'create'
      UserBook.create('user_id'=>current_user.id , 'book_id'=>params[:book_id])
    else
      userbook = UserBook.find_by({ :book_id => params[:book_id] , :user_id => current_user.id})
      userbook.delete
    end
    @check_in_book_type = params[:type]
    respond_to do |format|
      format.js { render 'front_end/js/check_in_book' }
    end
  end

  def autocomplete
    books = Book.search_title(params[:query])
    results = books.map { |e| {:title => e.title,:url => book_path(e.slug)} }
    render json: results
    # render json: Book.search(params[:query], autocomplete: true, limit: 10).map(&:title)
  end

  private
  	
    def custom_paginate(items)
      items.paginate(:page => params[:page], :per_page => 2)
    end
end
