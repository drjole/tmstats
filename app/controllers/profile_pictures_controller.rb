class ProfilePicturesController < ApplicationController
  def edit
    @user = User.find(params[:user_id])
    authorize @user
  end

  def update
    @user = User.find(params[:user_id])
    authorize @user
    if @user.update(profile_picture_params)
      redirect_to [:edit, @user], notice: t(".success")
    else
      redirect_to [:edit, @user], alert: t(".error")
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    authorize @user
    @user.profile_picture.purge_later
    redirect_to [:edit, @user], notice: t(".success")
  end

  private

  def profile_picture_params
    params.require(:user).permit(:profile_picture)
  end
end