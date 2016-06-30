require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest


  test "sign up with invalid information" do
    get signup_path
    assert_no_difference 'User.count' do 
      post users_path, params: {
        user: {username: "Red", 
               email: "invalid", 
               password: "peter", 
               password_confirmation: "peter"
      }
      } 
    end
    assert_template 'users/new'
    assert_select 'div#error_messages'
  end
  test "should signp with valid information" do
  get signup_path
  assert_difference 'User.count', 1 do 
    post users_path, params: {
      user: {username: "Redd", 
             email: "valid@gmail.com", 
             password: "petercheck", 
             password_confirmation: "petercheck"
    }
    } 
  end
  follow_redirect!
  assert_template 'users/show'
  assert_equal "Welcome to our app!", flash[:success]
  assert_select 'p', User.last.email
  end

end
