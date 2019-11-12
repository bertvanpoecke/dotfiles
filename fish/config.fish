set fish_greeting "Hello Bert"

source "$HOME/.config/fish/env.fish"
source "$HOME/.config/fish/alias.fish"

set localfile "$HOME/.config/fish/local.fish"
if test -e $localfile
	source "$HOME/.config/fish/local.fish"
end