require 'test_helper'

class CheckoutControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get prepare_checkout" do
    get :prepare_checkout
    assert_response :success
  end

  test "should get order_confirmation" do
    get :order_confirmation
    assert_response :success
  end

end
