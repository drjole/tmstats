class CreateExtensionsGamesJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :extensions, :games do |t|
      t.index :extension_id
      t.index :game_id
    end
  end
end
