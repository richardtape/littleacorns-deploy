# removal of static files after deploy
# this is because scanners search for files such as readme.html and license.txt to see
# if they exist - a bit of security through obscurity
def removestaticfiles()

	# Make a hash of files so it's easy to add to in the future. 
	# The key is what will be printed out
	# the value is the path upwards of the release's wp/ directory
	files = {}
	files["readme.html"] = 'readme.html'
	files["license.txt"] = 'license.txt'
	files["install.php"] = 'wp-admin/install.php'

	# Announce what we're doing
	puts "\n" + '[ ' + yellow( 'RUNNING' ) + " ] Remove static files"

	# loop over the files hash and remove the file, saying what we're going
	# use print so we can add to the same line
	files.each do |text, path|
		print "\n" + "............ removing " + "#{text}"
		execute "cd #{release_path} && cd wp && rm #{path}"
		print " .. " + green( "\u2713" )
	end

	puts "\n" + '[ ' + green( 'SUCCESS' ) + ' ] Static files removed'

end;