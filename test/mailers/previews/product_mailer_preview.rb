# Preview all emails at http://localhost:3000/rails/mailers/product_mailer
class ProductMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/product_mailer/product_confirmation
  def product_confirmation
    ProductMailer.product_confirmation
  end

end
