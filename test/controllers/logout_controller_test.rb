require 'test_helper'

class LogoutControllerTest < ActionController::TestCase
  test "should get login" do
    get /login/login
    assert_response :success
  end
end
