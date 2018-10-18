class ShippingAddress < ApplicationRecord
	validates :first_name,:last_name,:phone,:address,:email,:city, presence: true
end
