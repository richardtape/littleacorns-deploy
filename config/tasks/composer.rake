namespace :deploy do

	namespace :symlink do

		task :runcomposer do

			on roles :app do

				if test "[ -f #{fetch(:deploy_to)}isrollback.txt ]"

					puts "\n" + '[ ' + green( 'ROLLBACK' ) + " ] Skipping composer "

				else

					runcomposer( 'install' )

				end

			end

		end

	end

end