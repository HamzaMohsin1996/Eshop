    class CartsController < ApplicationController
	def create
		@cart =  Cart.create(product_id: params[:product_id], user_id:  current_user.id, quantity: params[:quantity])
		redirect_to cart_path(@cart)
	end
   	def show
   	  @carts = current_user.carts
   	end	
    def index
        @carts = current_user.carts.not_purchased
    end
     def new
      @carts = current_user.carts.purchased
     end

  
   	def manage_product
        if params[:type] == 'true'
            cart = Cart.find_or_create_by(product_id: params[:product_id], user_id:  current_user.id, purchased: false)
            cart.quantity = ((cart.quantity)? cart.quantity: 0) + params[:quantity].to_i
            cart.save
            # cart=Cart.where(product_id: params[:product_id], user_id:  current_user.id)
        else
            Cart.where(product_id: params[:product_id],user_id: current_user.id, purchased: false).destroy_all
            render json: {success: true }
   		end
      end

    def destroy
            @carts=Cart.find(params[:id])
            @carts.destroy
            session[:cart_id] = nil
            redirect_to carts_path
    end
end