class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create]

  def show
    @user = if params[:id]
      User.find(params[:id])
    else
      # /profile route
      Current.user
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to @user, notice: "Successfully registered."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "User edited."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :name, :password, :password_confirmation)
  end
end
