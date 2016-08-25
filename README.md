== README

# nerdSnap
## Built with Ruby on Rails

### Authors
[Trent Whitinger](https://github.com/twhitinger), [Jenny Soden](https://github.com/MsJennyGiraffe),
[Matthew Campbell](https://github.com/matthewecampbell)

This project was created as a part of the curriculum for the [Turing School of Software & Design](http://turing.io).

### Overview

This Rails application is a bidding site for nerdy collectable items. A user can bid on and sell items and can chat with other users about specific topics.

### Live Version

You can find a live version of this application on Heroku at: [https://nerdsnap.herokuapp.com/](https://nerdsnap.herokuapp.com/)

### Setup

To set up a local copy of this project, perform the following:

  1. Clone the repository: `git clone https://github.com/MsJennyGiraffe/the_pivot.git`
  2. `cd` into the project's directory
  3. Run `bundle install`
  4. Run `rake db:create db:migrate db:seed` to set up the postgres database and seed it.
    - If you would like to create your own users, artist, items, and categories do not run `db:seed`
    - The seed file includes a platform admin (username: "Jorge@turing.io", password: "password") login to Jorge's account to approve sellers.
  5. Run the application in the dev environment by running `rails s`

### App Features

Some of the main features of the app include: Chat Rooms to chat about any thing you would like with other users!  It also has a javascript countdown to let you know how much time is left to bid.  On Heroku we have a scheduler that will check the status of items up for bid every ten minutes.

#### Users

Users can bid on, buy now and sell collectable items.  They can also chat with other users.

#### Admins

Admins can edit any user's seller pages as well as approve and deny sellers and take them on and offline.

### Test Suite

The test suite tests the application on multiple levels. To run all of the tests, run `rspec` from the terminal in the main directory of the project. The feature tests rely mainly on the [capybara gem](https://github.com/jnicklas/capybara) for navigating the various application views.

### Dependencies

This application depends on many ruby gems, all of which are found in the `Gemfile` and can be installed by running `bundle install` from the terminal in the main directory of the project. The app also relies on our Sendgrid API key, which must be provided on a per-site-admin basis.
