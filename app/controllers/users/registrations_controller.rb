class Users::RegistrationsController < Devise::RegistrationsController

  def user_param
    params.require(:user)
      .permit(:name, :email, :password, :password_confirmation)
  end
end
