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

## Prerequisite
1. Set the Mailbox API key using command.
`export API_KEY=Your_API_Key`

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
1. Once rails server is started, search with the information(ie. user name & url).
2. It will return valid email based on information provided in search form using MailBox API.