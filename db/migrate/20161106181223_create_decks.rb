class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.string :deck_type
      t.integer :user_id

      t.timestamps
    end
  end
end
