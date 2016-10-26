class FrontEndController < ApplicationController
  before_action :generate_categories

  def index
    @posts = custom_paginate(Post.all)
  end

  def category
  	category = Category.find_by(slug: params[:slug])
  	@posts = custom_paginate(category.posts)
  	render 'index'
  end

  def tag
    tag = Tag.find_by(slug: params[:slug])
    @posts = custom_paginate(tag.posts)
    render 'index'
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
