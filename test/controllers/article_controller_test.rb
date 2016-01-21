require 'test_helper'

class ArticleControllerTest < ActionController::TestCase
  test "should get article" do
    get /artile/article
    assert_response :success
  end
  
  test "should go to newarticle" do
    get /article/newarticle
    assert_response :success
  end
  
  test "should come back" do
    get /article/details
    assert_response :successs
  end
  
  test "should create an article"
    assert_difference('Arcitle.count') do
      post :controller=>article,:action=>newarticle,article:{articlename:hello,content:hello}
    end
    assert_redirected_to /article/article
  end
  
  test "should create a comment"
    assert_difference('Comment.count') do
      post :controller=>article,:action=>newcomment,article:{content:hello}
    end
    assert_redirected_to /article/details
  end

end
