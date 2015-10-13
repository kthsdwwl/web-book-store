require 'test_helper'

class UserCartControllerTest < ActionController::TestCase
  test "should get show_user_cart" do
    get :show_user_cart
    assert_response :success
  end

end
