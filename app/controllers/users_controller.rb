get '/users' do
  @users = User.all
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do

  if params[:password_confirmation] == params[:user][:password]
    @user = User.new(params[:user])

    if @user.save
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @errors = @user.errors.full_messages
      erb :'users/new'
    end

  else
    @errors = ["Passwords do not match!"]
    erb :'users/new'
  end

end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

# get '/users/:id/edit' do
#   @user = User.find(params[:id])
#   erb :'users/edit'
# end
#
# put '/users/:id' do
#   @user = User.find(params[:id])
#   @user.update(params[:user])
#   redirect "/users/#{@user.id}"
# end
#
# delete '/users/:id' do
#   @user = User.find(params[:id])
#   @user.destroy
#   redirect "/users"
# end
