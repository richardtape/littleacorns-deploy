namespace :deploy do

	namespace :symlink do

		task :removestaticfiles do

			on roles :app do

				if test "[ -f #{fetch(:deploy_to)}isrollback.txt ]"

					puts "\n" + '[ ' + green( 'ROLLBACK' ) + " ] Skipping remove static files "

				else

					removestaticfiles()

				end

			end

		end

	end

end