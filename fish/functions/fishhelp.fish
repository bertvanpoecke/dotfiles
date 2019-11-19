function fishhelp --description 'Show all custom defined aliases and functions.'
	echo "## CUSTOM ALIASES:"
	cat "$FISHDOTFILES/alias.fish" | grep '^##\|^alias'
	echo
	echo
	echo "## CUSTOM FUNCTIONS:"
	for file in $FISHDOTFILES/functions/*.fish
		cat $file | grep '^function'
	end
end