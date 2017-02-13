class Users::PasswordsController < Devise::PasswordsController

  protected

  def after_sending_reset_password_instructions_path_for(resource_name)
    flash[:info] = 'Email sent with password reset instructions'
    redirect_to root_url
  end
end
