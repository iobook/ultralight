Ultralight Live Demo
----------------

You can view and test a working demo of Ultralight here:

<http://ultralight-demo.herokuapp.com>

### Steps

1.  Sign Up to create an Account

2.  Create a new Application.

3.  Download this Ruby file which will make several HTTP requests to the Heroku
    app.

<https://raw.githubusercontent.com/iobook/ultralight/master/demo/demo-tests.rb>

4. Move "demo-tests.rb" to your Desktop
5. Open your OS X "Terminal" application
6. Install the HTTParty gem

`sudo gem install httparty`

6. Type "ruby " with a space and drag "demo-test.rb" to the Terminal window to add the path to the file.
 
`ruby /path/to/demo/demo-tests.rb`

7. Type return to run the file

8.  You will be prompted to enter your *Application ID* and *User API Key*.

9.  The *Application ID* is available in the list of your Applications in the Dashboard.

10.  The *User API Key* is displayed at the top of the Dashboard.
11.  The terminal will display test results.

12.  Once tests are complete, refresh your Browser and confirm that the Classes
    count and Objects counts have changed in the Dashboard.


In addition to running the test file above you can make HTTP Requests on your
own:

`http://ultralight-demo.herokuapp.com/1/classes/Anything`

*Set HTTP Headers*

1.  Set **X-Ultralight-User-API-Key** to the User API Key displayed at the top
    of the dashboard.

2.  Set **X-Ultralight-Application-Id** to the Application ID displayed to the
    right of the application name in the list of applications.

*Set Body*

Include a JSON body for POST and PUT requests and leave the body blank for GET
and DELETE requests.


### Reference

Ultralight data consists of schemaless JSON objects so you can set any key-value pairs you want when storing an object.

For example, if you were tracking Quotes, a single object could contain:

    {
      "quote": "The philosophy behind much advertising is based on the old observation that every man is really two men -- the man he is and the man he wants to be.",
      "source": "William Feather"
    }

Keys must be alphanumeric strings. Values can be anything that can be JSON-encoded.

Objects and classes are organized into Applications. Each object has a class name that you can use to organize data within an Application. You might have an Idea class and a Quote class in the same Application.

When you retrieve objects from Ultralight, the object above might look like this when retrieved:

    {
      "quote": "The philosophy behind much advertising is based on the old observation that every man is really two men -- the man he is and the man he wants to be.",
      "source": "William Feather"
      "createdAt": "2011-08-20T02:06:57.931Z",
      "updatedAt": "2011-08-20T02:06:57.931Z",
      "Id": "53c8c9571aaab40002000004"
    }

Class operations operate on a resource based on the class name. For example, if the class name is `Quote`, the class URL is:

    https://api.Ultralight.com/1/classes/Quote

### Operations
When you make a POST request to e.g. /1/classes/Quote the class is created and will support all of the following operations.


| URL                    | HTTP Verb | Functionality   |
|------------------------|-----------|---|---|---|
| /1/classes/Quote | POST      | Creating Objects   |
| /1/classes/Quote/objectId | GET | Retrieve an Object  |
| /1/classes/Quote/objectId | PUT | Updating Objects   |
| /1/classes/Quote | GET | Retrieve a List of Objects   |
| /1/classes/Quote/objectId | DELETE | Deleting Objects   |


### Making Requests
For POST and PUT requests, the request body must be JSON, with the `Content-Type` header set to `application/json`.

### Authentication
Authentication is done via HTTP headers. The `X-Ultralight-Application-Id` header identifies which application you are accessing, and the `X-Ultralight-User-API-Key` header authenticates the endpoint.

When you sign up for an account you will receive a User API Key and when you create a new Application you will be given an Application API Key.

### Response Format

The response format for all requests is a JSON object.
