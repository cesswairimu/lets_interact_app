class LoginsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(username: params[:login][:username])
    if user && user.authenticate(params[:login][:password]) 
#login user
      redirect_to user
    else
      flash.now[:danger] = "Bunch, Weka vitu valid"
      render 'new'

    end
  end


end
