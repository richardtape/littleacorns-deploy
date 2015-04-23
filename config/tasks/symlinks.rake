namespace :deploy do

	namespace :symlink do

		task :makewpsymlinks do

			on roles :app do

				if test "[ -f #{fetch(:deploy_to)}isrollback.txt ]"

					puts "\n" + '[ ' + green( 'ROLLBACK' ) + " ] Skipping symlinks "

				else

					createsymlinks()

				end

			end

		end

	end

end