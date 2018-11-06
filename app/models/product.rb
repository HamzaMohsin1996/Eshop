class Product < ApplicationRecord
	validates :title, :price, :description,:category_id,  :image, presence: true
	belongs_to :category
	has_and_belongs_to_many :deals 
	belongs_to :user
	has_many :cart, dependent: :delete_all
	has_many :orders, through: :orderproduct
	 
	 def self.search(search)
	 	if search
	 		where(['title LIKE ?',"%#{search}%"])
	 	else
	 		all
	 end
  end

	
end