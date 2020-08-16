class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    if current_user.update(user_params)
      flash[:success] = "User updated"
      redirect_to current_user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation)
  end
end
