class CreateDiscountdeals < ActiveRecord::Migration[5.2]
  def change
    create_table :discountdeals do |t|
    	t.belongs_to :product
    	t.belongs_to :deal

      t.timestamps
    end
  end
end
