function c --description '`c` with no arguments opens the current directory in Visual Studio Code, otherwise opens the given location.'
	set argcount count $argv
	if test (count $argv) -gt 0
		code $argv[1]
	else
		code .
	end
end
