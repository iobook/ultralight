Heroku Live Demo
----------------

You can view and test a working demo of Ultralight here:

<http://ultralight-demo.herokuapp.com>

### Steps

1.  Sign Up to create an Account

2.  Create a new Application.

3.  Download this Ruby file which will make several HTTP requests to the Heroku
    app...LINK

4.  Run the file

`sudo gem install httparty`
`ruby /path/to/demo/demo-tests.rb`

1.  You will be prompted to enter your Application ID and User API Key.

2.  The Application ID is available in the list of your Applications in the Dashboard.

3.  The User API Key is displayed at the top of the Dashboard.

4.  Once tests are complete, refresh your Browser and confirm that the Classes
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
