class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from StandardError, with: :handle_error

  helper_method :current_user, :logged_in?

  def house_color(house_id)
    current_user.houses.find_by(id: house_id).present? ? current_user.houses.find_by(id: house_id).calendar_color : "#ddd"
  end

  def handle_error(e = nil)
    e ||= env['action_dispatch.exception']

    case e
    when ClientError
      handle_client_error(e)
    when ActionController::RoutingError, ActionController::UnknownFormat
      handle_client_error(NotFound.new)
    else
      raise e if Rails.env.development?

      message = Slack::Message::InternalServerError.new(
        exception: e,
        env: env,
        user: current_user,
      )
      SlackNotifier.new.send(message)

      error_500(e)
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def current_user?(user)
    user == current_user
  end
  helper_method :current_user?

  def error_401(_e)
    redirect_to :root, notice: 'You need to sign in'
  end

  def error_404(_e)
    render 'errors/404', status: 404
  end

  def error_500(_e)
    render 'errors/500', status: 500
  end

  def handle_client_error(e)
    case e
    when BadRequest
      error_400(e)
    when Unauthorized
      error_401(e)
    when Forbidden
      error_403(e)
    when NotFound
      error_404(e)
    when Conflict
      error_409(e)
    when Gone
      error_410(e)
    when UnprocessableEntity
      error_422(e)
    else
      error_500(e)
    end
  end

  # def logged_in?
  #   user_signed_in?
  # end
  # deprecate logged_in?: :user_signed_in?, deprecator: Deprecator.new
  # helper_method :logged_in?

  # ユーザーのログインを確認する
  def logged_in_user
    unless user_signed_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end


  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end


  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: 'ログインしてください'
  end
end

