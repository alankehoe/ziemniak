# Ziemniak

A machine translation service comparison tool. comparing
Bing and Yandex translation services

## How to install

#### Ensure has the following
* Ruby >= 1.9.3

#### Install some dependencies
```bash
# Install nvm
curl https://raw.githubusercontent.com/creationix/nvm/v0.7.0/install.sh | sh
source ~/.nvm/nvm.sh

# Install node
nvm use 0.10
nvm alias default 0.10

# Install Bower
npm install bower -g
```

#### Get the source
```bash
# Clone the source
git clone git@github.com:alankehoe/ziemniak.git

# Move into the directory
cd ziemniak
```

#### Install dependencies
```bash
# Install bundle gem
gem install bundle

# Install dependencies
bundle install

# Install assets with bower
bower install
```

#### Setup the Database
```bash
# Migrate the database
bundle exec rake db:migrate

# Seed the database
bundle exec rake db:seed_fu
```

#### Try it locally
```bash
# Run Rails server
bundle exec rails s

# Check it out in the browser
http://localhost:3000
```


#### License

MIT License. Copyright 2014 [Alan Kehoe](https://github.com/alankehoe)

#### Authors & contributors

* [Alan Kehoe](https://github.com/alankehoe), author
* [Krystian Jankowski](https://github.com/jankowk2), contributor
* [David O'Regan](https://github.com/Oregand), contributor