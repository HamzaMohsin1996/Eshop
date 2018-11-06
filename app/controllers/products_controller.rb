class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    #@products= Product.where("products.user_id = ?", current_user.id).order('created_at asc') 
    @products= Product.search(params[:search])
  end
  def show
    @product=Product.find(params[:id])
  end

  def new
    @product =Product.new
  end
  def edit
    @product =Product.find(params[:id])
  end
  def create
    @product = Product.new(product_params)
    @product.user=current_user
    if @product.save
      redirect_to @product
    else
      render  'new'
    end
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end
  def cart_products
    @product = Product.find(params[:products])
    render json: {success: true }
  end
  def deals_products
        @product = Product.find(params[:products])
        render json: {success: true }
  end
  private
  def product_params
    params.require(:product).permit(:title, :price, :description,:category_id,:image,:discount_price,:search)
  end
end
