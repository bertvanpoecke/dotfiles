function tag --description '`tag` with 1 argument <message> tags the current git repo with an increased tag number and message.'
	git-tag-develop $argv[1]
end