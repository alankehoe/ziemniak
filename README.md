# Ziemniak

A machine translation service comparison tool. comparing
Bing and Yandex translation services

### How to install

## Ensure has the following
* Ruby >= 1.9.3

## Get the source
```bash
git clone git@github.com:alankehoe/ziemniak.git
cd ziemniak
```

## Install dependencies
```bash
gem install bundle
bundle install
```

## Migrate Database
```bash
bundle exec rake db:migrate
```

## Create OAuth Application
```bash
bundle exec rake db:seed_fu
```

## Run Rails server
```bash
bundle exec rails s
```

## Open browser
navigate to `http://localhost:3000`


## License

MIT License. Copyright 2014 alankehoe

## Authors & contributors

* [Alan Kehoe](https://github.com/alankehoe), author
* [Krystian Jankowski](https://github.com/jankowk2), contributor
* [David O'Regan](https://github.com/Oregand), contributor