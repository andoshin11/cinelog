class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :check_user_status

  def user_param
    params.require(:user)
      .permit(:name, :email, :password, :password_confirmation)
  end
end
