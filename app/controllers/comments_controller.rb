class CommentsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)
		@comment.parent_id = params[:parent_id]
		@comment.user_id = current_user.id
		@comments = @post.comments.paginate(page: params[:page])
	    @comment2s = []
	    @comments.each do |comment|
	      unless comment.parent_id.nil?
	        @comment2s.push(comment)
	      end
	    end
	    if @comment.save
	      flash[:success] = "Comment created!"
	      respond_to do |format|
		      format.html { redirect_to post_path(@post.slug) }
		      format.js
		    end
	    else
	      redirect_to post_path(@post.slug)
	  	end
	end

	def destroy
		@comment= Comment.find(params[:id])
		@destroy_id = @comment.id
	    @post = @comment.post
	    @comment.destroy
	    respond_to do |format|
	      format.html { redirect_to post_path(@post.slug) }
	      format.js
	    end
	end

	private
    def comment_params
      params.require(:comment).permit(:content, :post_id, :parent_id)
    end
end
