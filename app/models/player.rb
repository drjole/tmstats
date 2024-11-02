class Player < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :corporation, optional: true

  validates :victory_points, numericality: {greater_than: 0}

  BASE_ELO = 1000

  def elo
    return nil unless game.ranked?

    elo_before_game + elo_impact
  end

  def elo_before_game
    previous_players = user.games.includes(players: :user).ranked.where.not(id: game.id).where(time: ...game.time).map { |game| game.player(user) }
    previous_players.sum(BASE_ELO, &:elo_impact)
  end
end
