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
        redirect_to signup_path
      end
    end
  end

  def show
    if current_user
      @user = User.find(current_user.id)  
    else
      redirect_to login_path
    end
    
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name)
    end
end
