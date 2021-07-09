## NAVIGATIION
# Easier navigation: .., ..., ...., ....., ~ and -
alias cd.. "cd .."
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

## Shortcuts
alias d "cd $DOCUMENTS_FOLDER"
alias dl "cd $DOWNLOADS_FOLDER"
alias dt "cd $DESKTOP_FOLDER"
alias p "cd $PROJECTS_FOLDER"

## GIT
alias g git
alias gs "git status"
alias gch "git checkout"
alias gm "git merge"
alias ga "git add -A"
alias githelp "cat $DOTFILES/docs/git_help.txt"

## Kubernetes
alias kubehelp "cat $DOTFILES/docs/kubernetes_help.txt"

## Filemanipulation
alias filemanipulation "cat $DOTFILES/docs/filemanipulation.txt"

## OPEN
# Brave Browser
alias obrave "open $BRAVE_APP"

## DELETE ACTIONS
# Recursively delete `.DS_Store` files
alias cleanupds "find . -type f -name '*.DS_Store' -ls -delete"
# Empty Trash
alias emptytrash "sudo rm -rfv ~/.Trash;"

## UPDATES
# Get macOS Software Updates
alias update "sudo softwareupdate -i -a;"

## MACOS SETTINGS
# Show/hide hidden files in Finder
alias show "defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide "defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
# Hide/show all desktop icons (useful when presenting)
alias hidedesktop "defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop "defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

## STORAGE
# Shows the 10 largest folders/files on disk
alias storage "du -a * | sort -r -n | head -10"
# Shows the free storage on the Macintosh HD
alias frees "df -H /System/Volumes/Data"
