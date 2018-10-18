class CreateProductdeals < ActiveRecord::Migration[5.2]
  def change
    create_table :productdeals do |t|
    	t.belongs_to :product
    	t.belongs_to :deal

      t.timestamps
    end
  end
end
