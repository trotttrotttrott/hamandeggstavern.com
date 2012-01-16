require 'bundler/capistrano'

load 'deploy/assets'

set :bundle_without,      [:development, :test]
set :bundle_gemfile,      'Gemfile'
set :bundle_flags,       '--deployment --quiet'
set :bundle_without,      [:development, :test]

default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :application, 'ham_and_eggs'
set :repository,  'git@github.com:trotttrotttrott/ham_and_eggs.git'
set :use_sudo, false

set :scm, :git
set :deploy_via, :remote_cache
set :user, 'rails'
ssh_options[:forward_agent] = true
ssh_options[:compression] = false

# task :staging do
# end

task :production do
  set :target, 'production'
  set :rails_env, 'production'
  set :deploy_to, '/home/rails/ham_and_eggs'
  set :branch, 'production'

  #TODO: SET THESE
  role :web, ''
  role :app, ''
  role :db, '', :primary => true
end

# This is for Passenger
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :bundler do
  task :create_symlink, :roles => [:app, :db] do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(release_path, 'vendor', 'bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end

  task :bundle_new_release, :roles => [:app, :db] do
    bundler.create_symlink
  end
end

namespace :git do
  desc 'Create a git tag of the current release'
  task :tag_release do
    ref = `git ls-remote -h #{repository} #{branch} | awk '{print $1}'`.chomp

    # ISO representation of the current time
    time = Time.now.utc.to_datetime.to_s
    time.gsub! /-|:/, ""
    time.gsub! /\+\d+$/, "Z"

    user = ENV['USER'].to_s.gsub(/\W/, '')

    command = "git tag #{target}-#{time}-#{user} #{ref} && git push origin --tags"
    puts(command)
    system(command)
  end
end

task :create_various_symlinks do
  run <<-EOS
    ln -s #{shared_path}/database.yml #{latest_release}/config/database.yml
  EOS
end

after 'deploy:rollback:revision', 'bundle:install'
after 'deploy:update_code', 'bundle:install'
before 'deploy:assets:precompile', 'create_various_symlinks'
after 'deploy:finalize_update', 'git:tag_release'

