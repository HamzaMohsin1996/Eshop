class UsersController < ApplicationController
	  before_action :current_user_products
	def index
		@user = User.all
     
	end
	def products
        @user= User.find(params[:id])
       
      end
      def current_user_products
        Product.where("products.user_id = ?", current_user.id).order('created_at asc')
     end
end
