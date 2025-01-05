class CorporationStatsService
  def initialize(corporations = :all)
    @corporations ||= (corporations == :all) ? Corporation.all : corporations
    @corporations_map = @corporations.index_by(&:id)
  end

  def picks
    @picks ||= to_hash(@corporations.left_joins(:games).group(:id).count("games.id"))
  end

  def wins
    @wins ||= to_hash(@corporations.left_joins(:players).group(:id).count("CASE WHEN players.rank = 1 THEN 1 ELSE NULL END"))
  end

  def average_rank
    @average_rank ||= to_hash(@corporations.left_joins(:players).group(:id).pluck(:id, Arel.sql("COALESCE(AVG(players.rank), 0)")))
  end

  def win_rate
    @win_rate ||= wins.each_with_object({}) do |(corporation, wins), hash|
      hash[corporation] = ((wins.to_f / (picks[corporation].zero? ? 1 : picks[corporation])))
    end
  end

  private

  def to_hash(rows)
    rows.each_with_object({}) do |(corporation_id, value), hash|
      hash[@corporations_map[corporation_id]] = value
    end
  end
end
