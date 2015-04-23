# Wrapper function for the setup command on the server
# Simply creates the requisite directories
# Places a message at the start and the end to indicate what is happening
def createdirectories()

	puts "\n" + '[ ' + yellow( 'RUNNING' ) + " ] Setup"

	execute "mkdir -p #{fetch(:deploy_to)}releases"
	execute "mkdir -p #{shared_path}"

	puts '[ ' + green( 'SUCCESS' ) + ' ]'

end