set :application, 'zemniak'
set :stages, %w(production staging)
set :default_stage, 'staging'

set :scm, :git
set :repo_url, 'git@github.com:alankehoe/ziemniak.git'
set :linked_files, %w{config/database.yml}
set :keep_releases, 5