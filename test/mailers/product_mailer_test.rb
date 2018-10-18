require 'test_helper'

class ProductMailerTest < ActionMailer::TestCase
  test "product_confirmation" do
    mail = ProductMailer.product_confirmation
    assert_equal "Product confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
