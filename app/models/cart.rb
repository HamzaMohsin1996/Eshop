class Cart < ApplicationRecord
	belongs_to :product
	belongs_to :user
	after_initialize :init
	scope :purchased , -> { where(purchased: true)}
	scope :not_purchased , -> { where(purchased: false)}
    def init
      self.quantity  ||= 0           #will set the default value only if it's nil
    end
   
end
