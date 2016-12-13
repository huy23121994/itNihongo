class UsersController < ApplicationController
  
	def show
		@user = User.find_by(username: params[:username])
		# abort @user.inspect
	end

  	def edit
  		@user = User.find_by(username: params[:username])
  		if signed_in? and @user.id != current_user.id
	  		redirect_to root_path
	  	end
  	end

  	def update
  		if current_user.update_attributes(user_update_params)
  			flash[:alert] = "profile updated"
  			redirect_to :back
  		else
  			flash[:alert] = "profile not updated"
  		end
  	end
  	
  	def read_books
  		@user = User.find_by(username: params[:username])
  		@books = @user.books
  	end
  	private
		def user_update_params
			params.require(:user).permit(:avatar,:fullname,:address)
		end
end
