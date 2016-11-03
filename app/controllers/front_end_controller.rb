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
    render 'show_book'
  end

  def all_book
    @books = Book.get_all_books()
    @category = 'Tất cả các sách'
    render 'list_books'
  end

  def show_item
  	@post = Post.find_by(slug: params[:slug])
    @comment = @post.comments.build
    @comments = @post.comments.paginate(page: params[:page])
    @comment1s = []
    @comment2s = []
    @comments.each do |comment|
      if comment.parent_id.nil?
        @comment1s.push(comment)
      else
        @comment2s.push(comment)
      end
    end
  end

  private
  	
    def custom_paginate(items)
      items.paginate(:page => params[:page], :per_page => 2)
    end
end
