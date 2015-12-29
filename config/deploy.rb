# config valid only for Capistrano 3.1
lock '3.1.0'
set :application, 'spoofsms'
set :repo_url, 'git@github.com:shakycode/spoofsms.git'
set :rbenv_type, :user
set :rbenv_ruby, '2.2.3'
set :rbenv_path, '/home/deploy/.rbenv/'
set :deploy_to, '/home/deploy/spoofsms'
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :keep_releases, 3
namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
