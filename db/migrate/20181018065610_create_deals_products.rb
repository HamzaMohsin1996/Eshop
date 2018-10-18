class CreateDealsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :deals_products do |t|
    	 t.belongs_to :deal, null: false
    	 t.belongs_to :product, null: false
    end
  end
end
