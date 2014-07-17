get '/users/signup' do
  
  session[:user_id] = nil
  @user = User.new

  erb :'user/signup'

end

get '/users/signin' do
  erb :'user/login'
end

get '/users/signout' do

  session[:user_id] = nil
  @user = nil

  flash[:notice] = "You have been signed out."
  redirect '/users/signin'

end

post '/users' do

  @user = User.create(params)
  
  if @user and @user.valid? then
    session[:user_id] = @user.id
    redirect '/applications'
  else
    flash[:notice] = "There was a problem with the information you provided. Please try again."
    redirect '/users/signup'
  end

end

# Uncomment for a list of all Users
# get '/users' do
#     return User.all.to_json
# end