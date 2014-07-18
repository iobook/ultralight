ultralight
==========

Backend As A Service application using Sinatra and MongoDB. 

## REST API

Ultralight is an API for storing and querying JSON objects and files.

A future goal for this project is to also provide a friendly content editing interface for clients to manage content that developers can then access via API.

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

Class operations operate on a resource based on just the class name. For example, if the class name is `Quote`, the class URL is:

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

### Setup on Heroku

1. Clone this repository
2. Create a Heroku app through their web app or toolbelt command line tool.
3. Add your new Heroku app's git url as a remote to this repository and push.

    ```
    git remote add heroku git@heroku.com:your-app-name.git
    git push heroku master
    ```

### Setup on OS X

1. Clone this repository
2. Install required gems.

    ```
    sudo gem install sinatra
    sudo gem install mongo_mapper
    sudo gem install bcrypt
    sudo gem install rack-flash
    sudo gem install securerandom
    ```
    
2. Start your local MongoDB server.

3. Run the Sinatra application

    ```
    ruby /path/to/app.rb
    ```


