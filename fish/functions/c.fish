function c --description '`c` with no arguments opens the current directory in Cursor, otherwise opens the given location.'
	set argcount count $argv
	if test (count $argv) -gt 0
		cursor $argv[1]
	else
		cursor .
	end
	set -e argcount
end
