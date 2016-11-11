get '/duels' do
  erb :'/duels/index'
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
  @user = User.find(current_user.id)
  @opponent = User.find_by(username: params[:opponent])
  @user_deck = Deck.find_by(name: params[:user_deck])
  @opponent_deck = Deck.find_by(name: params[:opponent_deck])
  @duel = Duel.new(user_deck_id: @user_deck.id, opponent_deck_id: @opponent_deck.id, user_id: @user.id, opponent_id: @opponent.id)
  # if @duel.save && request.xhr?
  if @duel.save
    redirect "/duels/#{@duel.id}"
  else
    redirect "/duels/new"
  end
end

get '/duels/:duel_id' do
  @duel = Duel.find(params[:duel_id])
  if logged_in?
    erb :'/duels/lifecounter'
    # convert_ip
  end
end
