class FrontEndController < ApplicationController
  before_action :generate_categories

  def index
    # @posts = custom_paginate(Post.all)
    @newest_books = Book.get_books(4)
  end

  def category
  	category = Category.find_by(slug: params[:slug])
  	# @books = custom_paginate(category.books)
    @books = category.books
  	render 'list_books'
  end

  def tag
    tag = Tag.find_by(slug: params[:slug])
    @posts = custom_paginate(tag.posts)
    render 'index'
  end

  def show_book
    @book = Book.find_by(slug: params[:slug])
    render 'show_book'
  end

  def all_book
    @books = Book.get_all_books()
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
