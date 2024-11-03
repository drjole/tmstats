class ChartController < ApplicationController
  def user_elo
    authorize :chart
    @data = User.find(params[:user_id]).players.includes(game: :players).select { |player| player.game.ranked? }.map do |player|
      {time: player.game.time, Rating: player.elo, game_id: player.game.id}
    end
  end
end
