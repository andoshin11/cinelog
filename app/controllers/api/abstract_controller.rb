class Api::AbstractController < ApplicationController
  before_action :reject_unauthorized_user

  private

  def error_500(e)
    render json: { error: 'Internal Server Error' }, status: 500
  end

  def handle_client_error(e)
    render json: { error: e.reason_phrase, message: e.message }.compact, status: e.status_code
  end

  def reject_unauthorized_user
    raise Unauthorized unless user_signed_in?
  end
end
