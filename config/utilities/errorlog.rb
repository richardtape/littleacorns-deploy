# Wrapper function to create error logs
# changes into the release path/content then creates a debug.log file chmods to 777 so it's writable
# Also outputs a message at the start and the end to say what it is doing
def makeerrorlog()

	puts "\n" + '[ ' + yellow( 'RUNNING' ) + " ] Make error logs"
	execute "cd #{release_path} && cd content && touch debug.log && chmod 777 debug.log"
	puts '[ ' + green( 'SUCCESS' ) + ' ] Error Logs Created'

end;