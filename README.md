# Sample car rental site

Sample site for Car Rental

# Description

This is a sample site for car rental. It allows users to sign up and post their cars. Users can also view other cars from other users and send messages to car owner.

* Ruby 2.2.5
* Rails 4.2.8
* Database: Postgresql 9.6 using postgis adapter

We also apply gems such as slim for template engine, devise for user registration/authentication, annotate, boostrap, rspec for testing, paperclip for uploading images etc 

# Storing upload images

We're using AWS S3 to store upload files on production. In case you deploy the app to Heroku, please set S3 credentials:

```$ heroku config:set S3_BUCKET_NAME=your_bucket_name
$ heroku config:set AWS_ACCESS_KEY_ID=your_access_key_id
$ heroku config:set AWS_SECRET_ACCESS_KEY=your_secret_access_key
$ heroku config:set AWS_REGION=your_aws_region
```

# Install

```bundle install```

```rake db:create```

```rake db:migrate```

# Run tests

We're using RSpec.

```rspec```

# Demo

We deployed it on Heroku. See it here https://sample-rent.herokuapp.com/