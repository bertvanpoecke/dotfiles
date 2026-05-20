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

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
