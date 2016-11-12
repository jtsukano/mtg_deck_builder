class CreateDuels < ActiveRecord::Migration
  def change
    create_table :duels do |t|
      t.integer :user_deck_id
      t.integer :opponent_deck_id
      t.integer :user_id
      t.integer :opponent_id
      t.integer :winner_id
      t.string :user_note
      t.string :opponent_note
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
