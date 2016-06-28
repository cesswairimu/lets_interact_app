require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "redirect to root url" do
    post :create, params: {
      user:{ 
        username: "valid",
        email: "validemail@gmail.com",
        password: "foobar",
        password_confirmation: "foobar" 
      }
    }
    assert_redirected_to root_url
  end
  
  test "successful sign up" do
    post :create, params: {
      user:{ 
        username: "valid",
        email: "validemail@gmail.com",
        password: "foobar",
        password_confirmation: "foobar" 
      }
    }
    assert_equal "Welcome to our app!", flash[:success]
  end
  test "Unsuccessful sign up" do
        post :create, params: {
      user:{ 
        username:"",
        email: "validemail@gmail.com",
        password: "foobar",
        password_confirmation: "foobar" 
      }
    }
 
  assert_template 'new'
  end
end

