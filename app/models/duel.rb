class Duel < ActiveRecord::Base
  belongs_to :user_deck, class_name: 'Deck'
  belongs_to :opponent_deck, class_name: 'Deck'
  belongs_to :user
  belongs_to :opponent, class_name: 'User'
  belongs_to :winner, class_name: 'User'
end
