class User < ApplicationRecord
rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :products
         has_many :carts
  after_create :assign_default_role
  def assign_default_role
    add_role(:newuser)
  end

  def username
    return self.email.split('@')[0].capitalize
  end

  def sub_total 
    sub_total = 0
    self.carts.not_purchased.each do |cart|
      sub_total += cart.product.price * cart.quantity
    end
    return sub_total
  end
end