class SessionsController < ApplicationController
  def new
    # redirect_to root_path if logged_in?
  end

  def create
    user = User.authenticate(email: params[:session][:email], password: params[:session][:password])

    if user.blank?
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    elsif user.activated?
      sign_in user
      redirect_back_or root_url
    else
      message = 'Account not activated. Check your email for the activation link.'
      flash[:warning] = message
      redirect_to root_url
    end
  end

  def destroy
    sign_out current_user
    redirect_to root_url
  end
end
