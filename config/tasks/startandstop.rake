# some output methods to declare we've started and ended
namespace :deploy do

	timestart = Time.now
	username=`whoami`

	# Let's announce we've started
	desc 'Put message on the console that the process has begun'
	task :declarestarted do

		on roles :app do

			puts "\n" + '[ ' + green( 'STARTED' ) + " ] deployment to " + blue( "#{fetch(:deploy_to)}" ) + " at #{timestart} by " + blue( "#{username}" )

		end

	end

	# Let's announce we've finished
	desc 'Put message on the console that the process has ended'
	task :declarefinished do

		on roles :app do

			timefinished = Time.now

			timeTaken = time_diff_milli timestart, timefinished
			puts "\n" + '[ ' + green( 'COMPLETED' ) + " ] Deployment in #{timeTaken} seconds. Nice!"

			# If we are on a mac, then display a notification
			darwinifmac=`uname`
			if [[ darwinifmac == 'darwin' ]]
				`osascript -e 'display notification "Deployment has completed to #{fetch(:deploy_to)}" with title "Deployment Complete"'`
			end

		end

	end

end