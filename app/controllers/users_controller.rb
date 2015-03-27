class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id
      flash[:success] = "Successfully registered with Stacker."
      redirect_to root_path
    else
      flash[:danger] = "Fields can't be blank."
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
