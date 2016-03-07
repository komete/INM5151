require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get Acceuil" do
    get :acceuil
    assert_response :success
  end

end
