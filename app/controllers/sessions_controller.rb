class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user_params = params.require(:user)
    user = User.confirm(user_params[:email], user_params[:password])
    if user
      login(user)
      redirect_to profile_path
    else
      #flash error messages
      redirect_to '/login'
    end
  end

  def destroy
  end
end
