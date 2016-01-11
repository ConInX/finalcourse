require 'test_helper'

class UserCourseControllerTest < ActionController::TestCase
  test "should get user_course" do
    get :user_course
    assert_response :success
  end

end
