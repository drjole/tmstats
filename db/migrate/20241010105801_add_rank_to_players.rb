class AddRankToPlayers < ActiveRecord::Migration[8.0]
  def up
    add_column :players, :rank, :integer
    Game.all.find_each do |game|
      game.players.each_with_index do |player, index|
        player.rank = index + 1
        player.save!
      end
    end
    change_column :players, :rank, :integer, null: true
  end

  def down
    remove_column :players, :rank
  end
end
