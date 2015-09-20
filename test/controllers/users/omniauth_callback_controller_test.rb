require 'test_helper'

class Users::OmniauthCallbackControllerTest < ActionController::TestCase
  test "should get facebook" do
    get :facebook
    assert_response :success
  end

end
