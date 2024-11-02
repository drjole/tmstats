class MetricsService
  def initialize(user)
    @user = user
  end

  def rank_rating
    @user.games.sum { |game| (game.players.count - game.rank(@user)) / (game.players.count - 1).to_f } / games.count.to_f
  end

  def elo_win_rate
    x = games.flat_map { |game| game.players.reject { |player| player.user == @user }.map { |player| (game.rank(@user) < player.rank) ? 1 : 0 } }
    x.sum / x.count.to_f
  end
end
