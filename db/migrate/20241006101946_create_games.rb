class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.date :date, null: false
      t.integer :num_generations, null: true

      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
