require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get connect" do
    get :connect
    assert_response :success
    assert_select "title", "Sign in"

  end

end
