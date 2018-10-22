class Users::ConfirmationsController < Devise::ConfirmationsController

  private

  def after_confirmation_path_for(resource_name, resource)
    if resource.confirmed?
      flash[:success] = "Account activated!"
      sign_in resource
      :dashboard
    else
      flash[:danger] = "Invalid activation link"
      :root
    end
  end
end
