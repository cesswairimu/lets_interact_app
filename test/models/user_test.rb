require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(username: "Great Eagle", email: "great@eagle.com", 
                     password: "angrybirds", password_confirmation: "angrybirds")
  end

  test "email should be unique" do 
    duplicate_user = @user.dup
    duplicate_user.email = @user.email
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end
  
  test "username should have minimum length" do
    @user.username = "a" * 3
    assert_not @user.valid?
  end

  test "email should have minimum length" do
    @user.email = "a" * 3 + "exa.com"
    assert_not @user.valid?
  end
  
  test "password should have minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
