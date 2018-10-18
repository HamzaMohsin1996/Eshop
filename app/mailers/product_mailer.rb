class ProductMailer < ApplicationMailer

  def product_confirmation(user)
    @user = user

    #mail to: @user.email, subject: "product is confirmation"
  end
end
