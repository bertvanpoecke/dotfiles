set fish_greeting "  ____            _
 |  _ \          | |
 | |_) | ___ _ __| |_
 |  _ < / _ \ '__| __|
 | |_) |  __/ |  | |_
 |____/ \___|_|   \__|"

set fishfolder (readlink $HOME/.config/fish)
source "$fishfolder/env.fish"
source "$fishfolder/alias.fish"

set localfile "$fishfolder/local.fish"
if test -e $localfile
	source $localfile
end

set -e localfile
set -e fishfolder
