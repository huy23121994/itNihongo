class UserController < ApplicationController
  
  	def show_user
    	@user = current_user
    	render 'front_end/show_user'
  	end

  	def update_user
  		abort params.inspect
  	end

end
