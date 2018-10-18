class DashboardController < ApplicationController
	before_action :authenticate_user!
	def index
		@products= Product.where("user_id = ?", current_user.id).order('created_at asc')
		@categories = @products.map(&:category) if@products.present?
		@categories = Category.all
   	end
  end
