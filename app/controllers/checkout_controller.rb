class CheckoutController < ApplicationController
	def index
		@shipping_address=ShippingAddress.all
	end
	def show
	    @shipping_address=ShippingAddress.find(params[:id])
	end
	
	 def new
		@shipping_address = ShippingAddress.new
	end	
	
   	 
		
	
	def create
		@shipping_address =ShippingAddress.new(address_params)
		if @shipping_address.save
			current_user.carts.update_all(purchased: true)
		 	redirect_to checkout_index_path
		else
			render 'new'
		end
	   end
	 def payment
		
	  end
	
 private
	def address_params
		params.require(:shipping_address).permit(:first_name,:last_name,:phone,:email,:address,:city)
	end
end

