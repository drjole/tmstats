class LeaderboardsController < ApplicationController
  def show
    authorize :leaderboards
    @users = User.placed
    @elos = @users.index_with { |user| EloService.new(user).current_elo }.sort_by(&:last).reverse
  end
end
