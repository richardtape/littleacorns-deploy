# If the deploy_to variable set in the stage contains "staging" then we are deploying to staging
# if [[ isstaging() == true ]]
# 	puts "\n" + '[ ' + green( 'TESTING' ) + " ] STAGING TRUE "
# else
# 	puts "\n" + '[ ' + green( 'TETING' ) + " ] STAGING FALSE "
# end
def isstaging()
	
	deployingto="#{fetch(:deploy_to)}"
	if deployingto.include? "staging"
		return true
	else
		return false
	end

end

# Show a waiting spinner when a task is going to take a while
# show_wait_spinner{
# 	execute_long_command_thing_here()
# }
def show_wait_spinner( fps=10 )

	chars = %w[| / - \\]
	delay = 1.0/fps
	iter = 0
	spinner = Thread.new do
		while iter do  # Keep spinning until told otherwise
			print chars[(iter+=1) % chars.length]
			sleep delay
			print "\b"
		end
	end
	yield.tap{ 			# After yielding to the block, save the return value
		iter = false 	# Tell the thread to exit, cleaning up after itself…
		spinner.join 	# …and wait for it to do so.
	} 				# Use the block's return value as the method's

end