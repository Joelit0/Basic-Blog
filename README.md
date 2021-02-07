### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.0.0](https://github.com/Joelit0/Blog-Udemy-Course/blob/master/.ruby-version#L4)
- Rails [6.1.1](https://github.com/Joelit0/Blog-Udemy-Course/blob/master/Gemfile#L7)

##### 1. Check out the repository

```bash
git clone git@github.com:Joelit0/Blog-Udemy-Course.git
```

##### 2. Install gems

Run the following command to install all gems required in the Gemfile.

```ruby
bundle install
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

### Production Enviroment

You can also visit the blog in production at: http://blog-udemy-course.herokuapp.com
