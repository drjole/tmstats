class SmeService
  STARTING_ELO = 1000
  K = 32

  def initialize(user)
    @user = user
  end

  def current_elo
    Rails.cache.fetch("#{@user.cache_key_with_version}/sme/current_elo") do
      elo(@user.games.ranked.last)
    end
  end

  def elo(game, memo = nil)
    return nil unless @user.ranked?

    memo ||= {}
    memo[@user] ||= {}

    result = memo.dig(@user, game)
    return result if result.present?

    if game.blank?
      memo[@user][game] = STARTING_ELO
      return STARTING_ELO
    end

    my_player = game.players.find { |player| player.user == @user }
    my_game_index = @user.games.ranked.find_index(game)
    my_previous_game = if my_game_index == 0
      nil
    else
      @user.games.ranked[my_game_index - 1]
    end
    my_elo = elo(my_previous_game, memo)
    total_elo_adjustment = 0

    game.players.select { |player| my_player.rank - 1 == player.rank || my_player.rank + 1 == player.rank }.each do |player|
      their_game_index = player.user.games.ranked.find_index(game)
      their_previous_game = if their_game_index == 0
        nil
      else
        player.user.games.ranked[their_game_index - 1]
      end

      their_elo = SmeService.new(player.user).elo(their_previous_game, memo)
      q_a = 10.0**(my_elo / 400.0)
      q_b = 10.0**(their_elo / 400.0)
      e_a = q_a / (q_a + q_b)
      s_a = (my_player.rank < player.rank) ? 1 : 0
      elo_adjustment = K * (s_a - e_a)

      total_elo_adjustment += elo_adjustment
    end

    result = my_elo + total_elo_adjustment
    memo[@user][game] = result
    result
  end
end
