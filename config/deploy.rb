require "bundler/capistrano"
load 'deploy/assets'
default_run_options[:pty] = true

set :application, ENV['SITE_NAME'].downcase.gsub(/\W/, "_")
set :repository,  'https://github.com/adamtao/delivr.git'
set :deploy_via, :remote_cache
set :scm, :git 
set :user, ENV['DEPLOY_USER']
set :use_sudo, false

server ENV['DEPLOY_HOST'], :web, :app, :db, primary: true

before "deploy:restart", "deploy:migrate"
after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :symlink_configs_and_stuff, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/application.yml #{release_path}/config/application.yml"
    # run "ln -nfs #{shared_path}/config/puma.rb #{release_path}/config/puma/production.rb"

    run "cp #{shared_path}/public/favicon.ico #{release_path}/public/favicon.ico"
    run "cp #{shared_path}/app/assets/images/logo.png #{release_path}/app/assets/images/logo.png"
    run "cp #{shared_path}/app/assets/images/page_bg.png #{release_path}/app/assets/images/page_bg.png"
    run "cp #{shared_path}/app/assets/stylesheets/framework_and_overrides.css.scss #{release_path}/app/assets/stylesheets/framework_and_overrides.css.scss"
  end
  after "deploy:update_code", "deploy:symlink_configs_and_stuff"
  before "deploy:assets:precompile", "deploy:symlink_configs_and_stuff"

end