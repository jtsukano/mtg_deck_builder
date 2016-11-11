get '/duels' do
  erb :'/duels/index'
end

get '/duels/:duel_id' do
  if logged_in?
    @duel = Duel.find(params[:duel_id])
    erb :'/duels/lifecounter'
  end
end

get '/duels/new' do
  if logged_in?
    erb :'/duels/new'
  else
    redirect '/session/new'
  end
end

post '/duels' do
  # taking params from the new game form to create a new instance of a duel.
  # certain fields of the duel instance will be left out until the duel ends so
  # users can input a description of the game if they want.
  @user = User.find(params[:username])
  @opponent = User.find(params[:opponent])
  @user_deck = Deck.find(params[:user_deck])
  @opponent_deck = Deck.find(prams[:opponent_deck])
  @duel = Duel.new(user_deck_id: @user_deck.id, opponent_deck_id: @opponent_deck.id, user_id: @user.id, opponent_id: @opponent.id) {locals: {:duel => @duel}}
  redirect "/duels/#{@duel.id}"
end
