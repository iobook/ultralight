ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative '../app'

class APITest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup

    test_mod = rand(10000)

    test_user = User.create!(:name => "Test User #{test_mod}", :email => "#{test_mod}@example.com", 
      :password => "P", :password_confirmation => "P")
  
    test_application = test_user.applications.create!(:name => test_mod)
  
    current_session.header 'X-Ultralight-User-API-Key', test_user.api_key #'5830f39442cb1c474cfc1e'
    current_session.header 'X-Ultralight-Application-Id', test_application.id #'53c6dbfe9ce3c03095000002'

    body = {:X => "Y"}.to_json

    post('/1/classes/Tests', body)
    
    @item = JSON.parse(last_response.body) 

  end

  def test_create_object
    
    assert last_response.ok?
    assert_equal 'Tests', @item["object_class"]
    assert_equal 'Y', @item["X"]

  end

  def test_read_object

    get "/1/classes/Tests/#{@item['id']}"
    
    item = JSON.parse(last_response.body)

    assert last_response.ok?
    assert_equal 'Tests', item["object_class"]
    assert_equal 'Y', item["X"]

  end

  def test_read_objects

    get "/1/classes/Tests"
    
    items = JSON.parse(last_response.body)

    assert last_response.ok?
    assert_equal 'Tests', items.last["object_class"]
    assert_equal 'Y', items.last["X"]

  end

  def test_update_object

    body = {:A => "B"}.to_json

    put("/1/classes/Tests/#{@item['id']}", body)    
    get "/1/classes/Tests/#{@item['id']}"

    item = JSON.parse(last_response.body)

    assert_equal 'B', item["A"]

  end

  def test_delete_object

    delete "http://localhost:4567/1/classes/Tests/#{@item['id']}"

    assert last_response.ok?

  end

end