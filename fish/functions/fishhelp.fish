function fishhelp --description 'Show all custom defined aliases and functions.'
	echo "## CUSTOM ALIASES:"
	cat "$DOTFILES/alias.fish" | grep '^##\|^alias'
	echo
	echo
	echo "## CUSTOM FUNCTIONS:"
	for file in $DOTFILES/functions/*.fish
		cat $file | grep '^function'
	end
end