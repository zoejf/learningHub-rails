class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    if current_user
      redirect_to profile_path
    else
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id

        #redirect to show page for that user
        redirect_to profile_path
      else 
        #flash error message and redirect
        redirect_to signup_path
      end
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name)
    end
end
