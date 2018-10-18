class AddPurchasedToCarts < ActiveRecord::Migration[5.2]
  def change
  	  add_column :carts, :purchased, :boolean, default: false
  end
end
