class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "Welcome #{user.first_name}!"
      redirect_to user
    else
      flash.now[:danger] = 'Login failed. Please try again.'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
