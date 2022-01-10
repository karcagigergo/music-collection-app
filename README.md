### Title: Music collection app

This is a music collection app made with Ruby On Rails. Link: (https://baby-names-list.herokuapp.com/)
It is also a challenge by [Moat Builders] (https://www.moat.ai//).

### Specs:

- Rails (rails 6.1.4);
- Ruby (ruby 3.0.0)
- psql (PostgreSQL 12.4) - database;
- devise (4.8.0) - for user authentication
- simple form

### How to install:

1. Clone the project and create your own repository:
   - `git@github.com:karcagigergo/music-collection-app.git --origin music-collection-app your-project-name`
   - `cd your-project-name`
   - `git init .`
   - `git add .`
   - `git commit`
   - `hub create`
2. Install dependencies:
   - `bundle install`
   - `yarn install`

### How to use:

1. run `rails s`, to boot up the local server
2. When running the application it automatically creates a user (username: user, password: 123456) and an admin (username: admin, password: 123456) - of course, if you want to create any kind of user it is absolutely possible.
3. As a user you can create and edit Albums, as an admin you can delete them too.

### Features [as shown in the challenge description](https://gitlab.com/-/snippets/2167416):

1. Login:

- Basic login page with the fields `username` and `password`
- Once logged in the user should be able to access all internal pages of the music app
  - If a not-logged in user tries to access any internal page he should be redirected to the login page
- After a successful login the user should be redirected to the `Artists list` page
- A failed login attempt will send the user back to the login page with the error: `Sorry, we couldn't find an account with this username. Please check you're using the right username and try again.`

2. Albums:

- CRUD actions for the albums are available
- Only admins can DELETE albums (users can add and edit)
- Each album will contain the following fields:
  - `Artist` let user select from the list of existing artists
  - `Album name`
  - `Year`

3. Artist List:

- Only allowed artists should be accepted by the app. The app must load the list of artists from an API.
- Endpoints:
  - (https://moat.ai/api/task/) - return a list of artists link
  - (https://moat.ai/api/task/?artist_id=<artist_id>) - return the artists data link
  - Authorization:
    - None
  - Header:
    - Set `Basic ZGV2ZWxvcGVyOlpHVjJaV3h2Y0dWeQ==` on Header
-
