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

alias tree "tree -L 3"
alias treed "tree -d -L 3"

## GIT
alias g git
alias gs "git status"
alias gch "git checkout"
alias gm "git merge"
alias ga "git add -A"
alias gfp "git fetch --prune"
alias gp "git pull"
alias gpp "git pull && git push"
alias gpu "git push -u origin"
alias gst "git stash"
alias gstp "git stash pop"
alias gbl "git branch -l"
alias gbd "git branch -d"
alias githelp "cat $DOTFILES/docs/git_help.txt"
alias gl "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --abbrev-commit -n 20"

alias bb "open https://bitbucket.org/dashboard/repositories"

## Kubernetes
alias kubehelp "cat $DOTFILES/docs/kubernetes_help.txt"

## Docker
alias dockerhelp "cat $DOTFILES/docs/docker_help.txt"
alias compose "cd $DOCKERCOMPOSE_FOLDER"
alias dup "docker compose up -d"
alias ddown "docker compose down"
alias akhq "docker compose -f $DOCKERCOMPOSE_FOLDER/akhq/docker-compose.yaml up -d && sleep 5 && open http://localhost:8080"

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
