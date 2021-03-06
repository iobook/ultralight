require 'sinatra'
require 'bcrypt'
require 'rack-flash'
require 'securerandom'
require 'active_support'
require 'active_support/core_ext'
require 'rack-flash'
require 'mongo_mapper'

require_relative 'models/application'
require_relative 'models/item'
require_relative 'models/user'

require_relative 'controllers/user'
require_relative 'controllers/session'
require_relative 'controllers/item'
require_relative 'controllers/application'

# configure do
#   MongoMapper.database = 'development'
# end

configure do
  MongoMapper.setup({'production' => {'uri' => ENV['MONGOHQ_URL']}}, 'production')
end

enable :sessions
use Rack::Flash

#Context for all methods
before do

if request.path_info.include?("classes") then

	api_user_key = request.env['HTTP_X_ULTRALIGHT_USER_API_KEY']
	
	@user = User.find_by_api_key(api_user_key)

	unless @user then
		halt 401, {'Content-Type' => 'text/plain'}, {'error' => 'Invalid User API Key.'}.to_json
	end

	application_id = request.env['HTTP_X_ULTRALIGHT_APPLICATION_ID']

	unless application_id then
		halt 401, {'Content-Type' => 'text/plain'}, {'error' => 'No application ID Provided.'}.to_json
	end

	@application = @user.applications.find(application_id)

	unless @application then
		halt 401, {'Content-Type' => 'text/plain'}, {'error' => 'Invalid application ID.'}.to_json
	end

else #This is not an API request but an App request like signing in or viewing a list of applications.

	@user = User.find(session[:user_id])

	if !@user and !request.path_info.include?("sessions") and !request.path_info.include?("users") then
		flash[:notice] = "Please login to continue."
		redirect '/users/signin'
	end

end

end