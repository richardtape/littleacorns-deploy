# Wrapper function for composer install
# Argument is the actual composer command to run (as it may be different on different stages)
# Outputs a message at the start and the end, and, as it can be a long task it also uses a spinner to indicate something is happening
# Takes a composer command (i.e. anything after "composer ") such as 'install'
# Usage: runcomposer( 'install' )
def runcomposer( command )

	composertimestart = Time.now
					
	puts '[ ' + yellow( 'RUNNING' ) + " ] Composer #{command} (may take a while)"

	show_wait_spinner{
		execute "cd #{release_path} && composer #{command}"
	}

	composertimefinished = Time.now
	timeTaken = time_diff_milli composertimestart, composertimefinished

	puts '[ ' + green( 'SUCCESS' ) + ' ] composer ' + "#{command} completed in " + "#{timeTaken}seconds"

end