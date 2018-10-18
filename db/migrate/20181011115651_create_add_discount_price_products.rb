class CreateAddDiscountPriceProducts < ActiveRecord::Migration[5.2]
  def change
    	add_column :products, :discount_price, :integer
    end
  end
