class Admin::ReviewsController < ApplicationController
	before_action :signed_in_user, :check_role

    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find(params[:id])
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to admin_reviews_path
    end
end
