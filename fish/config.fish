set fish_greeting "  ____            _
 |  _ \          | |
 | |_) | ___ _ __| |_
 |  _ < / _ \ '__| __|
 | |_) |  __/ |  | |_
 |____/ \___|_|   \__|"

source "$HOME/.config/fish/env.fish"
source "$HOME/.config/fish/alias.fish"

set localfile "$HOME/.config/fish/local.fish"
if test -e $localfile
	source "$HOME/.config/fish/local.fish"
end