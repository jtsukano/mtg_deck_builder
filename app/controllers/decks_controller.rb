get '/decks/new' do
  if current_user
    erb :'decks/new'
  else
    erb :'sessions/new'
  end
end

post '/decks' do
  @deck = Deck.new(name: params[:name], type: params[:type], user_id: session[:id])
  if @deck.save
    redirect "/users/#{@deck.id}"
  else
    @errors = @deck.errors.full_messages
    erb :'decks/new'
  end
end
