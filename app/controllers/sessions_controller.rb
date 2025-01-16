class SessionsController < ApplicationController
  allow_unauthenticated_access only: [:new, :create]
  allow_unauthorized_access

  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to login_path, alert: t(".alert") }

  def new
    redirect_to root_path if authenticated?
  end

  def create
    if (user = User.authenticate_by(params.permit(:email_address, :password)))
      start_new_session_for user
      redirect_to after_authentication_path, notice: t(".notice")
    else
      redirect_to login_path, alert: t(".alert")
    end
  end

  def destroy
    terminate_session
    redirect_to login_path, notice: t(".notice")
  end
end
