require 'test_helper'

class CommentsbyauserControllerTest < ActionController::TestCase
  test "should get commentsbyauser" do
    get :commentsbyauser
    assert_response :success
  end

end
