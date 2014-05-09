set :stage, :production

set :deploy_to, '/home/zemniak/'
set :tmp_dir, '/home/zemniak/tmp'

server 'zemniak@app.raven.com',
       user: 'zemniak',
       roles: %w{web app db},
       ssh_options: {
           user: 'zemniak',
           forward_agent: true,
           keys: %w(~/.ssh/id_rsa),
           auth_methods: %w(publickey)
       }

namespace :deploy do
  after :finishing, 'deploy:cleanup', 'ziemniak:generate_docs'

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'load the database with seed data'
  task :seed do
    on roles(:db), in: :sequence, wait: 5 do
      with rails_env: fetch(:rails_env) do
        execute "cd #{current_path}; bundle exec rake db:seed_fu RAILS_ENV=production"
      end
    end
  end

  before 'assets:precompile', 'migrate' do
    on roles(:app), in: :sequence, wait: 5 do
      with rails_env: fetch(:rails_env) do
        execute 'bower install'
      end
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do

    end
  end
end