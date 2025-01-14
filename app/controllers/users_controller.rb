class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create]

  before_action :set_user, only: [:show, :edit, :create, :update, :destroy]

  def index
    authorize User
    @users = User.all
  end

  def show
    authorize @user
  end

  def new
    authorize User
    @user = User.new
  end

  def edit
    authorize @user
  end

  def create
    authorize User
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: t(".notice")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to [:edit, @user], notice: t(".notice")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @user
    @user.destroy!
    redirect_to root_path, notice: t(".notice")
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :name, :password, :password_confirmation, :profile_picture)
  end

  def set_user
    @user = if params[:id]
      User.find(params[:id])
    else
      # For /profile... routes
      Current.user
    end
  end
end
