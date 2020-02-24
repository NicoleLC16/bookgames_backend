class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :content
      t.string :ctype
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
    end
  end
end
