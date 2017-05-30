# README twitterclone project

##Project title

twitterclone

##Project description

This is a learning project whereby twitter is cloned



## system version

Ruby version 2.4.1


## Getting Started

1. Get the codebase

  ```bash
  https://github.com/vananrajaindern/twitter_clone.git
  ```

2.Install gem dependencies

  ```bash
  cd twitter_clone
  bundle install
  #bundle dependencies would be available on gemfile
  ```

3. Setup Database

  ```bash
  rake db:create db:migrate
  ```
  _____________________________________________________>30.05.17

4. Start the application

  ```bash
  # Start the web server
  rails server
  ```

## Testing

We use [Rspec](https://github.com/rspec/rspec-rails) as our testing framework. So, during development, run these regularly.

```bash
# Run the specs
rspec
```

## Branch Policy

We follow the [Github Flow](https://guides.github.com/introduction/flow/) when developing the application, and name our branches as follow:

- `master` is the active development branch

Local development branch naming:

- `feature/<your-branch-name>` for substantial new feature or function
- `enhance/<your-branch-name>` for minor feature or function enhancement
- `bugfix/<your-branch-name>` for bug fixes

## Deployment

We deploy our application to heroku.. Automatic deployment has been setup for our production environment as documented [here](https://devcenter.heroku.com/articles/github-integration#automatic-deploys). To manually deploy to heroku with Git, you need to:

1. Register a heroku account and request access to production app
2. Install [heroku toolbelt](https://toolbelt.heroku.com/) which is a CLI tool for creating and managing Heroku apps
3. Setup heroku remote

  ```bash
  # Setup heroku remote for production
  git remote add heroku https://git.heroku.com/ac-project-sample.git
  ```




Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# twitter_clone






###Terminal commands for github for branching

Note: 3 types of commands feature, enhance and bugfix

1. git checkout -b enhance/readme
2. git add . 
3. git commit -m 'text'
4. git push -u origin enhance/readme