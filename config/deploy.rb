# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'littleacorns_deploy'
set :repo_url, 'git@github.com:richardtape/littleacorns-deploy.git'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :error
set :log_level, ask('What log level?', 'error')

# Default value for keep_releases is 5
set :keep_releases, 3


# If we're doing a rollback, we don't want to do our custom tasks
namespace :deploy do

	before :reverting, :declarerollback
	before :finishing_rollback, :undeclarerollback

end



# Our custom tasks for running composer and making WP Symlinks and error log file
namespace :deploy do

	namespace :symlink do

		before :release, :runcomposer
		before :release, :makewpsymlinks
		before :release, :makeerrorlog
		before :release, :removestaticfiles

	end

end


# some output methods to declare we've started and ended
namespace :deploy do

	before :starting, :declarestarted
	before :finished, :declarefinished

end


# Realistically this task is only here to be used once, at the very beginning. But it's necessary to test everything and
# set up directories. I don't like the fact it's needed on both stages, but what can you do? (someone tell me, please!)
namespace :deploy do

	# This task should only be needed once, but simply sets up the bits and pieces we need for a cap setup
	desc 'Set up the directories we need for capistrano deploy'
	task :setup do

		on roles :app do

			createdirectories()

		end

	end

end


load "config/utilities/colors.rb"
load "config/utilities/time.rb"
load "config/utilities/errorlog.rb"
load "config/utilities/composer.rb"
load "config/utilities/setup-directories.rb"
load "config/utilities/symlinks.rb"
load "config/utilities/rollback.rb"
load "config/utilities/general-utilities.rb"
load "config/utilities/removestaticfiles.rb"
