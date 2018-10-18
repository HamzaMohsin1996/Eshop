class CreateDealsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :deals_products do |t|
    	 t.belongs_to :deals, null: false
    	 t.belongs_to :products, null: false
    end
  end
end
