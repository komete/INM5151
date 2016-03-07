require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get Signin" do
    get :connect
    assert_response :success
  end

end
