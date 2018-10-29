class Product < ApplicationRecord
	validates :title, :price, :description,:category_id,  :image, presence: true
	belongs_to :category
	has_and_belongs_to_many :deals 
	belongs_to :user
	has_many :cart, dependent: :delete_all
	has_many :orders, through: :orderproduct
	#has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#",large:"600x600" }
	#validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	#validates_attachment_content_type :image, :content_type => /image/ 
	
end