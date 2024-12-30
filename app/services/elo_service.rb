class EloService
  STARTING_ELO = 1000
  K = 32

  def initialize(user)
    @user = user
  end

  def current_elo
    elo(@user.games.ranked.last)
  end

  def elo(game)
    return STARTING_ELO if game.blank?

    my_player = game.player(@user)
    return my_player.elo if my_player.elo_impact.present?

    my_previous_game = previous_game(game)
    my_elo = elo(my_previous_game)
    elo_impact = 0

    game.players.excluding(my_player).each do |player|
      their_elo_service = EloService.new(player.user)
      their_previous_game = their_elo_service.previous_game(game)
      their_elo = their_elo_service.elo(their_previous_game)

      q_a = 10.0**(my_elo / 400.0)
      q_b = 10.0**(their_elo / 400.0)
      e_a = q_a / (q_a + q_b)
      s_a = (my_player.rank < player.rank) ? 1 : 0
      player_elo_impact = K * (s_a - e_a)

      elo_impact += player_elo_impact.round
    end

    my_player.update!(elo_impact: elo_impact)
    my_elo + elo_impact
  end

  def previous_game(game)
    @user.games.ranked.where.not(id: game.id).where(time: ...game.time).last
  end
end
