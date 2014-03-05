require 'test_helper'

class ShopControllerTest < ActionController::TestCase
  test "should get view_cart" do
    get :view_cart
    assert_response :success
  end

end
