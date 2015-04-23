namespace :deploy do

	namespace :symlink do

		task :makeerrorlog do

			on roles :app do

				if test "[ -f #{fetch(:deploy_to)}isrollback.txt ]"

					puts "\n" + '[ ' + green( 'ROLLBACK' ) + " ] Skipping error logs "

				else

					makeerrorlog()

				end

			end

		end

	end

end