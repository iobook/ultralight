require 'httparty'
require 'json'

##############################################################################
#SET THESE VARIABLES BEFORE RUNNING TESTS
#Object type. Change to test working with multiple classes.

print "Enter your User API Key: "
@user_api_key = gets.strip

print "Enter your Application ID: "
@app_id = gets.strip

#TODO Prompts or external config file / environment vars
@class = "Tests"
@host = "http://ultralight-demo.herokuapp.com"
@path = "1/classes"
##############################################################################


body = {"X" => "Y", "A" => "B", "1" => "2"}.to_json

headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json', 
'X-Ultralight-User-API-Key' => @user_api_key, 'X-Ultralight-Application-Id' => @app_id}

 #CREATE AN OBJECT

 object = HTTParty.post("#{@host}/#{@path}/#{@class}",
  { 
    :body => body,
    :headers => headers
  })

 @object = JSON.parse(object)
 test_did_create_object = @object["application_id"] == @app_id
 puts "Testing CREATE Object"
 puts test_did_create_object ? "Success" : "Failed"
 puts ""

 #UPDATE THE OBJECT

  body = {"X" => "Y-U", "A" => "B-U", "1" => "2-U"}.to_json

  object = HTTParty.put("#{@host}/#{@path}/#{@class}/#{@object['id']}",
  { 
    :body => body,
    :headers => headers
  })
 
  object = JSON.parse(object)
  #puts object.inspect

  test_did_update_object = object['X'] == "Y-U"
  puts "Testing UPDATE Object"
  puts test_did_update_object ? "Success" : "Failed"
  puts ""

  #READ A SINGLE OBJECT

    object = HTTParty.get("#{@host}/#{@path}/#{@class}/#{@object['id']}",
  { 
    :headers => headers
  })
 
  object = JSON.parse(object)

  puts "Testing READ of One Object"
  test_did_read_one_object = object['X'] == "Y-U"
  puts test_did_read_one_object ? "Success" : "Failed"
  puts ""
  #puts object.inspect

  #READ SEVERAL OBJECTS
  
   objects = HTTParty.get("#{@host}/#{@path}/#{@class}",
  { 
    :headers => headers
  })
  
  objects = JSON.parse(objects)
  
  puts "Testing READ of Multiple Objects"
  if objects[1] then
    test_did_read_multiple_objects = objects.last["A"] == "B-U"
  else
    test_did_read_multiple_objects = false
  end
  puts test_did_read_multiple_objects ? "Success" : "Failed"
  puts ""

  puts "Delete Test Skipped"
  #  deletion = HTTParty.delete("#{@host}/#{@path}/#{@class}/#{@object['id']}",
  # { 
  #   :headers => headers
  # })

  # puts "Testing DELETE of Object"
  # # test_did_delete_object = 
  # deletion = JSON.parse(deletion)
  # test_did_delete_object = deletion["id"] == @object['id']
  # puts test_did_delete_object ? "Success" : "Failed"