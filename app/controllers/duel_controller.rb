get '/game' do
  if logged_in?
    erb :'/duels/new'
  else
    redirect '/session/new'
  end
end

post '/game' do
  @user = User.find(params[:username])
  @opponent = User.find(params[:opponent])
  @user_deck = Deck.find(params[:user_deck])
  @opponent_deck = Deck.find(prams[:opponent_deck])
  @duel = Duel.new(user_deck_id: @user_deck.id, opponent_deck_id: @opponent_deck.id, user_id: @user.id, opponent_id: @opponent.id)
end
