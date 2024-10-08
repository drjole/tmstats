class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email_address, null: false, index: {unique: true}
      t.string :password_digest, null: false
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
