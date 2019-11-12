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
alias ga "git add -A"

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
