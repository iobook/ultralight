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
11. Once tests are complete, refresh your Browser and confirm that the Classes
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
