class DealsController < ApplicationController
	def index
		@deals = Deal.all
	end
	def show
		@deals = Deal.find(params[:id])
	end
	def new
		@deals =Deal.new
	end
	def create
		@deals =Deal.new(deals_params)
		if @deals.save
		redirect_to deals_path
	   else
	   	render 'new'
	   end
	end			
	def deals_products

		@products = Product.all
		byebug
		if params[:product_ids].present?
			@product = Product.find(params[:product_ids])
			@product.price
		end
	end

  def destroy	
    @deal = Deal.find(params[:id])
    @deal.delete
    redirect_to deals_path
  end
	def selected_products

	end
	private
	def deals_params
		params.require(:deal).permit(:title,:description,:price,:discount_price, :_destroy)
	end
end
