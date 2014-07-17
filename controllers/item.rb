##########
=begin
	
All requests require two header variables:

1) X_DATA_API_USER_API_KEY
Available to each registered User when they login to the admin app.

2) X_DATA_API_APPLICATION_ID
Available in a list of applications available to the User when they login into the admin app.

Create and Update require a JSON payload as the body of the request.

=end
##########

#Create
post '/1/classes/*' do

  request.body.rewind
  request_body = request.body.read
  
  if request_body.length then 
  	request_payload = JSON.parse request_body
  else
  	error_message = {:error => "Empty JSON Payload"}.to_json
  	return error_message
  end

  submited_data = request_payload
  submited_data[:object_class] = params[:splat][0]

  item = @application.items.create(submited_data)

  return item.to_json

end

#List
get '/1/classes/:class_name' do

	items = @application.items.where(:object_class => params[:class_name])
	return items.to_json

end

#View
get '/1/classes/*/*' do

	item = @application.items.find(params[:splat][1])
	
	if item then
		return item.to_json
	else
		error_message = {:error => "Could not find item."}.to_json
		return error_message
	end

end

#Update
put '/1/classes/*/*' do

  request.body.rewind
  request_body = request.body.read
  
  if request_body.length then 
  	submited_data = JSON.parse request_body
  else
  	error_message = {:error => "Empty JSON Payload"}.to_json
  	return error_message
  end
	
  item = @application.items.find(params[:splat][1])
  item.update_attributes!(submited_data)

  unless item then
	error_message = {:error => "Could not find item."}.to_json
	return error_message
  end

  return item.to_json

end

#Delete
delete '/1/classes/*/*' do

	item = @application.items.find(params[:splat][1])
	item_id = item.id
	item.delete

	return {:id => item_id}.to_json

end