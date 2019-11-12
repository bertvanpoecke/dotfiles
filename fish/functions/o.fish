function o --description '`o` with no arguments opens the current directory, otherwise opens the given location.'
	if test (count $argv) -gt 0
		open $argv[1]
	else
		open .
	end
end
