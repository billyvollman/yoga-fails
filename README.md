Creating my first CRUD web app using Ruby and Sinatra.

Website will be about **Yoga Fails**.

Link to my project is here:
[Yoga Fails](https://yogafails.herokuapp.com/)

The idea of web app is to have a laugh at Yoga Fails (photos or gifs) and to encourage users to upload the Yoga Fails they witness or take part in.  In addition to having a laugh, I'd like to also link the page to places where people can learn or participate in Yoga, so they can learn and stop failing.  On the stop failing page Yoga studios and yoga groups will be able to list information about themselves.  It will be a directory for people to learn more about Yoga studios and events in their local area.  The stop failing page is a stretch goal.

[Wireframes that I designed during the planning proces](https://github.com/billyvollman/yoga-fails/blob/master/Wireframes%20of%20app.JPG)

**Functionality of web app:**
* To be able to upload a Yoga Fail, users will need to have an account and be logged in.
* Registered and logged in users will also be able to comment on Yoga Fails.
* Registered and logged in users will also be able to like Yoga Fails.
* The main page will list Yoga Fails based on date added and be shown as a smaller thumbnail version.
* When you click on the thumbnail the bigger image will appear with the comment section and likes visible.

* In the beginning project will have 4 models.
    - users
    - fails
    - comments
    - likes

* There will be sign up / log in functionality for users
* Project will utilise RESTful routes
* Gems used in project are:
    - gem 'sinatra'
    - gem 'pg'
    - gem 'active_record'
    - gem 'bcrypt'

* Logged in users can click on the 'stop failing' link and the yoga studios that are shown are from the Google Map API using the Places Search text settings.  Note it might not work because my daily quota of API calls is very low. 
