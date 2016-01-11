require 'test_helper'

class ArticlesbyauserControllerTest < ActionController::TestCase
  test "should get articlesbyauser" do
    get :articlesbyauser
    assert_response :success
  end

end
