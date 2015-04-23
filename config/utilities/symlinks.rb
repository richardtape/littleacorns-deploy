# Wrapper function to make symlinks
# @todo: make this more abstracted, write a function which takes a path and a symlink path
def createsymlinks()

	puts "\n" + '[ ' + yellow( 'RUNNING' ) + " ] Make WordPress symlinks"

	# execute "cd #{release_path} && cp #{fetch(:deploy_to)}shared/.htaccess ."
	# execute "cd #{release_path} && cd content && cp #{fetch(:deploy_to)}shared/sunrise.php ."
	#
	# execute "cd #{release_path} && cd content && cp #{fetch(:deploy_to)}shared/ps_ubc_findnode.csv ."
	# execute "cd #{release_path} && cd content && cp #{fetch(:deploy_to)}shared/UserInfo.ini ."
	#
	# execute "cd #{release_path} && ln -s #{shared_path}/index.php index.php"
	# execute "cd #{release_path} && cd content && cp #{shared_path}/sunrise.php ."
	# execute "cd #{release_path} && ln -s #{shared_path}/wp-config.php wp-config.php"
	# execute "cd #{release_path} && cd content && ln -s #{shared_path}/uploads uploads"
	# execute "cd #{release_path} && cd content && ln -s #{shared_path}/blogs.dir blogs.dir"
	# execute "cd #{release_path} && mkdir -p content/mu-plugins && cd content/mu-plugins && ln -s #{shared_path}/subdir-loader.php subdir-loader.php"

	execute "cd #{release_path} && cd content && mkdir -p mu-plugins"
	execute "cd #{release_path} && ln -s #{shared_path}/index.php index.php"
	execute "cd #{release_path} && ln -s #{shared_path}/wp-config.php wp-config.php"
	execute "cd #{release_path} && cd content && ln -s #{shared_path}/uploads uploads"
	execute "cd #{release_path} && cd content/ && ln -s #{release_path}/wp/wp-content/themes themes"
	execute "cd #{release_path} && cd content/mu-plugins && ln -s #{shared_path}/subdir-loader.php subdir-loader.php"
	execute "cd #{release_path} && cd content/plugins/memcached && rm object-cache.php"
	execute "cd #{release_path} && cd content/plugins/memcached && ln -s #{shared_path}/object-cache.php object-cache.php"

	puts '[ ' + green( 'SUCCESS' ) + ' ] Symlinks Created'

end
