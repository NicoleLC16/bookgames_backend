class CreateUsersGame < ActiveRecord::Migration[6.0]
  def change
    create_table :users_games do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
    end
  end
end
