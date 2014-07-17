get '/applications/new' do
	
	flash[:notice] = nil
	erb :'application/new'

end

get '/applications' do
	
	@applications = @user.applications
	
	flash[:notice] = nil
	erb :'application/dashboard'

end

post '/applications' do

	application = @user.applications.create(params)

	if application then
		flash[:notice] = "Application created."
		redirect '/applications'
	else
		flash[:notice] = "Error creating application."
		redirect '/applications/new'
	end

end

