class PasswordsController < ApplicationController
  def edit
    @user = User.find(params[:user_id])
    authorize @user
  end

  def update
    @user = User.find(params[:user_id])
    authorize @user
    if @user.update(password_params)
      redirect_to [:edit, @user], notice: t(".success")
    else
      redirect_to [:edit, @user], notice: t(".error")
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
