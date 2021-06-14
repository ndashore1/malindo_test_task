# Malindo Task
## Dependencies
* Ruby version : 3.0.0
* Rails Version : 6.1.3.2
* Node version : v15.12.0
* Yarn version : 1.22.10
## Configuration
```gem install bundler && bundle install```
```yarn install```
## Setup and Start the Applicaton
### Database Setup
```rake db:create && rake db:migrate```
### Run the rails server
```rails s```
## Test Environment Setup
### Test Database Setup
```RAILS_ENV=test rake db:create && RAILS_ENV=test rake db:migrate```
### Run the Test Suit
```rspec```
## How to use?
1. Add your the API key in ```config/initializers/mailbox_layer.rb```
2. Once rails server is started, search with the information(ie. user name & url).
3. It will return valid email based on information provided in search form using MailBox API.