# If we're doing a rollback, we don't want to do our custom tasks
namespace :deploy do

	# Add a file to say we're rolling back
	# This is only run if we are doing a rollback
	desc 'Declare rollback by creating temp file'
	task :declarerollback do

		on roles :app do

			createrollbackfile()

		end

	end

	# At the end of the rollback, remove the file
	desc 'Remove the temp file we created to declare we are rolling back'
	task :undeclarerollback do

		on roles :app do

			deleterollbackfile()

		end

	end

end