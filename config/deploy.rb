# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

set :application, "artion"
set :repo_url, "git@github.com:williamafil/artion_api.git"

set :user, 'deploy'
set :rails_env, "production"
set :branch, 'main'
set :keep_releases, 5
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"

append :linked_files, "config/master.key"
append :linked_dirs, "log", "sorage", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# namespace :deploy do
#   desc 'Restart application'
#     task :restart do
#       on roles(:app), in: :sequence, wait: 5 do
#       invoke 'puma:restart'
#     end
#   end
#   namespace :check do
#     before :linked_files, :set_master_key do
#       on roles(:app), in: :sequence, wait: 10 do
#         unless test("[ -f #{shared_path}/config/master.key ]")
#           upload! 'config/master.key', "#{shared_path}/config/master.key"
#         end
#       end
#     end
#   end
# end

namespace :deploy do
  # rails db:seed
  desc "reload the database with seed data"
  task :seed do
    on roles(:app) do
      within current_path do
        execute :bundle, :exec, 'rails', 'db:seed', 'RAILS_ENV=production'
      end
    end
  end
  # drop db
  desc 'Drop database'
  task :drop_db do
    on roles(:app) do
      within current_path do
        execute :bundle, :exec, 'rails', 'db:drop', 'RAILS_ENV=production', 'DISABLE_DATABASE_ENVIRONMENT_CHECK=1'
        # execute :bundle, :exec, 'rails', 'db:create', 'RAILS_ENV=production'
        # execute :bundle, :exec, 'rails', 'db:migrate', 'RAILS_ENV=production'
      end
    end
  end
  # migrate DB
  desc 'Migrate database'
  task :migrate_db do
    on roles(:app) do
      within current_path do
        # execute :bundle, :exec, 'rails', 'db:drop', 'RAILS_ENV=production', 'DISABLE_DATABASE_ENVIRONMENT_CHECK=1'
        # execute :bundle, :exec, 'rails', 'db:create', 'RAILS_ENV=production'
        execute :bundle, :exec, 'rails', 'db:migrate', 'RAILS_ENV=production'
      end
    end
  end
  # 覆蓋原本的 puma 指令
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # invoke 'puma:restart'
      invoke 'puma:stop'
      invoke 'puma:start'
    end
  end
  # 上傳 public底下的東西
  desc 'Upload public folder'
  task :upload_public do
    on roles(:app) do
      upload! 'public/', "#{shared_path}/public/", recursive: true
      
    end
  end
  # 上傳 master.key 
  namespace :check do
    before :linked_files, :set_master_key do
      on roles(:app), in: :sequence, wait: 10 do
        unless test("[ -f #{shared_path}/config/master.key ]")
          upload! 'config/master.key', "#{shared_path}/config/master.key"
        end
      end
    end
  end

end

namespace :nginx do
  # 建立軟連結 (僅首次需使用)
  desc 'Setup symlink to nginx'
  task :config do
    on roles(:app), in: :sequence, wait: 10 do
      unless test("[ -f /etc/nginx/sites-enabled/#{fetch(:application)} ]")
        execute :sudo, :ln, '-nfs', 
          "/home/#{fetch(:user)}/#{fetch(:application)}/current/config/nginx.conf", 
          "/etc/nginx/sites-enabled/#{fetch(:application)}"
      end
    end
  end
  # Nginx 相關指令
  [:start, :stop, :restart, :reload, :status].each do |nginx_action|
    desc "Nginx #{nginx_action}"
    task nginx_action do
      on roles(:app) do
        execute :sudo, :service, :nginx, nginx_action
      end
    end
  end
end


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
