class PasswordResetsController < ApplicationController
  allow_unauthenticated_access
  allow_unauthorized_access

  before_action :set_user_by_token, only: [:edit, :update]

  def new
  end

  def edit
  end

  def create
    if (user = User.find_by(email_address: params[:email_address]))
      PasswordsMailer.reset(user).deliver_later
    end

    redirect_to login_url, notice: t(".notice")
  end

  def update
    if @user.update(params.permit(:password, :password_confirmation))
      redirect_to login_url, notice: t(".notice")
    else
      redirect_to edit_password_reset_url(params[:token]), alert: t(".alert")
    end
  end

  private

  def set_user_by_token
    @user = User.find_by_password_reset_token!(params[:token])
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to new_password_reset_url, alert: t(".alert")
  end
end
