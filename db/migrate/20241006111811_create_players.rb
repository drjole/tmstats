class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.references :corporation, null: false, foreign_key: true
      t.integer :victory_points

      t.timestamps
    end
  end
end
