require 'test_helper'

class ArticleControllerTest < ActionController::TestCase
  test "should get article" do
    get :article
    assert_response :success
  end

end
