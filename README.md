[![Build Status](https://travis-ci.org/paresharma/ask-and-tell.svg?branch=master)](https://travis-ci.org/paresharma/ask-and-tell) [![Maintainability](https://api.codeclimate.com/v1/badges/49ad7eb7567d9eecd866/maintainability)](https://codeclimate.com/github/paresharma/ask-and-tell/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/49ad7eb7567d9eecd866/test_coverage)](https://codeclimate.com/github/paresharma/ask-and-tell/test_coverage)

# Ask and tell

Ask questions and answer to questions

[https://ask-and-tell.herokuapp.com](https://ask-and-tell.herokuapp.com)

# Set up

```
# clone the repo
git clone https://github.com/paresharma/ask-and-tell.git

cd ask-and-tell

# install ruby if not already
rbenv install

# install gems
bundle install

# set up db
rails db:create
rails db:migrate

# run tests - runs rpsec, simplecov and rubocop
rake

# start server
GOOGLE_CLIENT_ID=<client_id> GOOGLE_CLIENT_SECRET=<secret> bundle exec rails s

```

## Use new Rails credentials

Remove the encrypted credentials and then run `credential:edit` to update new credentials

```
rm config/credentials.yml.enc

rails credentials:edit
```

Update the credentials accordingly

```
# Used as the base secret for all MessageVerifiers in Rails, including the one protecting cookies.
secret_key_base: super_secret_key_base

google:
  client_id: client_id_from_google_console
  client_secret: client_secret_from_google_console
```
