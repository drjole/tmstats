class User < ApplicationRecord
  has_many :sessions, dependent: :destroy

  has_many :players
  has_many :games, through: :players

  validates :email_address, presence: true, uniqueness: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_secure_password

  has_one_attached :profile_picture do |attachable|
    attachable.variant :profile, resize_to_limit: [200, 200]
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :tiny, resize_to_limit: [24, 24]
  end

  scope :ranked, -> { where(ranked: true) }

  STARTING_ELO = 1000
  K = 32

  def rank_rating
    games.sum { |game| (game.players.count - game.players.find { |player| player.user == self }.rank) / (game.players.count - 1).to_f } / games.count.to_f
  end

  def elo_win_rate
    x = games.flat_map { |game| game.players.reject { |player| player.user == self }.map { |player| (game.players.find { |player| player.user == self }.rank < player.rank) ? 1 : 0 } }
    x.sum / x.count.to_f
  end

  def current_elo
    Rails.cache.fetch("#{cache_key_with_version}/current_elo") do
      elo(games.ranked.last)
    end
  end

  def elo(game, memo = nil)
    return nil unless ranked?

    memo ||= {}
    memo[self] ||= {}

    result = memo.dig(self, game)
    return result if result.present?

    if game.blank?
      memo[self][game] = STARTING_ELO
      return STARTING_ELO
    end

    my_player = game.players.find { |player| player.user == self }
    my_game_index = games.ranked.find_index(game)
    my_previous_game = if my_game_index == 0
      nil
    else
      games.ranked[my_game_index - 1]
    end
    my_elo = elo(my_previous_game, memo)
    total_elo_adjustment = 0

    game.players.reject { |player| player.user == self }.each do |player|
      their_game_index = player.user.games.ranked.find_index(game)
      their_previous_game = if their_game_index == 0
        nil
      else
        player.user.games.ranked[their_game_index - 1]
      end

      their_elo = player.user.elo(their_previous_game, memo)
      q_a = 10.0**(my_elo / 400.0)
      q_b = 10.0**(their_elo / 400.0)
      e_a = q_a / (q_a + q_b)
      s_a = (my_player.rank < player.rank) ? 1 : 0
      elo_adjustment = K * (s_a - e_a)

      total_elo_adjustment += elo_adjustment
    end

    result = my_elo + total_elo_adjustment
    memo[self][game] = result
    result
  end

  def current_sme
    sme(games.ranked.last)
  end

  def sme(game, memo = nil)
    return nil unless ranked?

    memo ||= {}
    memo[self] ||= {}

    result = memo.dig(self, game)
    return result if result.present?

    if game.blank?
      memo[self][game] = STARTING_ELO
      return STARTING_ELO
    end

    my_player = game.players.find { |player| player.user == self }
    my_game_index = games.ranked.find_index(game)
    my_previous_game = if my_game_index == 0
      nil
    else
      games.ranked[my_game_index - 1]
    end
    my_elo = sme(my_previous_game, memo)
    total_elo_adjustment = 0

    game.players.select { |player| my_player.rank - 1 == player.rank || my_player.rank + 1 == player.rank }.each do |player|
      their_game_index = player.user.games.ranked.find_index(game)
      their_previous_game = if their_game_index == 0
        nil
      else
        player.user.games.ranked[their_game_index - 1]
      end

      their_elo = player.user.sme(their_previous_game, memo)
      q_a = 10.0**(my_elo / 400.0)
      q_b = 10.0**(their_elo / 400.0)
      e_a = q_a / (q_a + q_b)
      s_a = (my_player.rank < player.rank) ? 1 : 0
      elo_adjustment = K * (s_a - e_a)

      total_elo_adjustment += elo_adjustment
    end

    result = my_elo + total_elo_adjustment
    memo[self][game] = result
    result
  end
end
