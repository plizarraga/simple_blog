class LoginsController < ApplicationController
  def new
    redirect_to root_path if current_user
    @user = User.new
  end

  def create
    @user = User.find_by(login_params)

    puts  @user

    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "Email or password is wrong!"
      render :new, status: :unprocessable_entity
    end
  end

  private
  def login_params
    params.require(:user).permit(:email, :password)
  end
end
