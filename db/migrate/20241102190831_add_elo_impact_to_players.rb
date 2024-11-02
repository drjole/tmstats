class AddEloImpactToPlayers < ActiveRecord::Migration[8.0]
  def change
    add_column :players, :elo_impact, :integer
  end
end
