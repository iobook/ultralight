post '/sessions' do

	user = User.authenticate(params[:email], params[:password])

	if user then
	  session[:user_id] = user.id
	  flash[:notice] = "Logged in!"
	  redirect '/applications'
	else
	  flash[:notice] = "Invalid email or password"
	  redirect '/users/signin'
	end

end