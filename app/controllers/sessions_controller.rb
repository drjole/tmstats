class SessionsController < ApplicationController
  allow_unauthenticated_access only: [:new, :create]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to login_url, alert: "Try again later." }

  def new
    redirect_to root_path if authenticated?
  end

  def create
    if (user = User.authenticate_by(params.permit(:email_address, :password)))
      start_new_session_for user
      redirect_to after_authentication_url, notice: "Successfully logged in."
    else
      redirect_to login_url, alert: "Try another email address or password."
    end
  end

  def destroy
    terminate_session
    redirect_to login_url, notice: "Successfully logged out."
  end
end
