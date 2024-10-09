class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.integer :victory_points, null: false

      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.references :corporation, null: true, foreign_key: true

      t.timestamps
    end
  end
end
