ultralight
==========

Backend As A Service application using Sinatra and MongoDB. 

## REST API

The REST API lets you interact with Ultralight from anything that can send an HTTP request. There are many things you can do with the REST API. For example:

* A mobile website can access Ultralight data from Javascript.
* A webserver can show data from Ultralight on a website.
* You can upload large amounts of data that will later be consumed in a mobile app.
* You can download recent data to run your own custom analytics.
* Applications written in any programming language can interact with data on Ultralight.
* You can export all of your data if you no longer want to use Ultralight.

### Quick Reference

Storing data through the Ultralight REST API is built around a JSON encoding of the object's data. This data is schemaless, which means that you don't need to specify ahead of time what keys exist on each object. You simply set whatever key-value pairs you want, and the backend will store it.

For example, let's say you're tracking Quotes. A single object could contain:


    {
      "quote": "The philosophy behind much advertising is based on the old observation that every man is really two men -- the man he is and the man he wants to be.",
      "source": "William Feather"
    }

Keys must be alphanumeric strings. Values can be anything that can be JSON-encoded.

Each object has a class name that you can use to distinguish different sorts of data. For example, we could call have an Idea class and a Quote class.

When you retrieve objects from Ultralight, some fields are automatically added: `createdAt`, `updatedAt`, and `Id`. These field names are reserved, so you cannot set them yourself. The object above could look like this when retrieved:


    {
      "quote": "The philosophy behind much advertising is based on the old observation that every man is really two men -- the man he is and the man he wants to be.",
      "source": "William Feather"
      "createdAt": "2011-08-20T02:06:57.931Z",
      "updatedAt": "2011-08-20T02:06:57.931Z",
      "Id": "Ed1nuqPvcm"
    }

In the REST API, the class-level operations operate on a resource based on just the class name. For example, if the class name is `Quote`, the class URL is:


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

When you sign up for an account you will receive a User API Key and when you create a new application you will be given an Application API Key.

### Response Format

The response format for all requests is a JSON object.


### Setup on Heroku


1. Clone this repository
2. Install heroku toolbelt: https://toolbelt.heroku.com/
3. Create a new application on Heroku

    ```
    heroku apps:create my_application
    ```

4. Add a new remote to the cloned repository -- use the git url returned by heroku create
4. Push your clone of this repository to Heroku 
    ```
    git push heroku master
    ```

5. Add the MongoDB Add-On to the Application created above via Heroku admin application.

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


