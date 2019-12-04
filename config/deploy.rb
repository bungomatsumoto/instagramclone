# config valid only for current version of Capistrano
lock '3.6.0'

set :application, 'tacostagram'
set :repo_url, 'https://github.com/bungomatsumoto/instagramclone'

set :branch, ENV['BRANCH'] || 'master'

set :deploy_to, '/var/www/tacostagram'


set :linked_files, %w{.env config/secrets.yml}
set :linked_files, %w{log tmp/pids tmp/cache tmp/sockets publick/uploads}

set :keep_releases, 5

set :rbenv_ruby, '2.6.3'
set :rbenv_type, :system

set :log_level, :debug

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end