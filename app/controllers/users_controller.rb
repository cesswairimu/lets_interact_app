class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
   redirect_to root_url 
   flash[:success]= "Welcome to our app!"
  end
end
