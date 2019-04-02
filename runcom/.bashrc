# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Find dotfiles base path, with the -f option for full path if necessary
if readlink -f ~/.bashrc > /dev/null 2>&1; then
	DOTFILES=`dirname $(readlink -f ~/.bashrc)`
else
	DOTFILES=`dirname $(readlink ~/.bashrc)`
fi

# Source the dotfiles (order matters)
# Order:.{function,function_*,path,env,alias,grep,prompt,nvm,completion,custom}
for DOTFILE in "$DOTFILES"/system/.{functions,env,alias,prompt}; do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done

# Clean up
unset DOTFILES DOTFILE

