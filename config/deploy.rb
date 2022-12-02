lock '3.8.0'

# Define the name of the application
set :application, 'game_room'
set :user, 'navin'
set :scm, :git
set :repo_url, 'https://github.com/navinspm/game_room.git'
set :git_http_username, 'navinspm'
set :git_http_password, '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'

# Define where to put your application code


set :puma_user, fetch(:user)
set :puma_threads,    [4, 16]
set :puma_workers,    0

set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix:#{shared_path}/tmp/sockets/game_room-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, false
set :puma_error_log,  false
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true




set :format, :pretty

# To save uploaded files
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads public/assets} 
set :linked_files, %w{config/database.yml Gemfile.lock config/master.key }

namespace :deploy do 
  desc 'Restart application'
   task :restart do
     on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
       execute :mkdir, '-p', "#{ release_path }/tmp"
       execute :touch, release_path.join('tmp/restart.txt')
     end
   end
   after :publishing, :restart
 end
