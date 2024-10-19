class LeaderboardsController < ApplicationController
  def show
    authorize User
    @users = User.ranked
  end
end
