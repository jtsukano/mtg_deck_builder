# TABLE.delete_all

User.delete_all
Deck.delete_all
Duel.delete_all

User.create!( :username  => 'jay',
              :email      => 'jay@jay.com',
              :password   => 'jay' )

User.create!( :username  => 'tim',
              :email      => 'tim@tim.com',
              :password   => 'tim' )

Deck.create!( :name  => 'jay',
              :deck_type   => 'jay',
              :user_id => 1)

Deck.create!( :name  => 'tim',
              :deck_type   => 'tim',
              :user_id => 2)

Duel.create!( :user_deck_id  => 1,
              :opponent_deck_id => 2,
              :user_id => 1,
              :opponent_id => 2,
              :winner_id => 1,
              :user_note => 'jay',
              :opponent_note => 'tim',
              :longitude => -122.397463,
              :latitude => 37.784596)
