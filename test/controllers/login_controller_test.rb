require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  
  setup do
    @user =User.new
  end
  
  test "should get login" do
    get /login/login
    assert_response :success
  end
  
  test "should go to index" do
    get /login/index
    assert_response :success
  end
  
  test "should go to user_course"
    post /login/login , user:{name:limingyang, password:limingyang
    assert_redirected_to /user_course/user_course
  end
  
  test "wrong name and password"
    post /login/login , user:{name:limingyang, password:cuowudemima
    assert_redirected_to /login/login
  end
  
  
  test "empty name"
    post /login/login , user:{name:, password:cuowudemima
    assert_redirected_to /login/login
  end
  
  test "empty password"
    post /login/login , user:{name:limingyang, password:}
    assert_redirected_to /login/login
  end

end
