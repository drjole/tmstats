class ChartController < ApplicationController
  def user_elo
    authorize :chart
    @data = user_data(User.find(params[:user_id]))
  end

  def elo
    authorize :chart
    @data = User.ranked.placed.map { |user| [user.id, user_data(user)] }.to_h
  end

  private

  def user_data(user)
    user.games.includes(players: :user).ranked.map do |game|
      {time: game.time, Rating: game.player(user).elo, game_id: game.id, user_name: user.name}
    end
  end
end
