# Wrapper function to make a rollback.txt file if we're actually doing a rollback
def createrollbackfile()

	execute "cd #{fetch(:deploy_to)}/ && touch isrollback.txt"

end

# Wrapper function to delete the rollback.txt file on cleanup after finishing a rollback
def deleterollbackfile()

	execute "cd #{fetch(:deploy_to)}/ && rm isrollback.txt"

end