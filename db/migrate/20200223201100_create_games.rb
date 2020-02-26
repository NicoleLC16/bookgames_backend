class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :rules
      t.string :score
      t.text :tasks, array: true, default: []
      t.integer :host

      t.timestamps
    end
  end
end
