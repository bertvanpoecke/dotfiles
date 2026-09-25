set -gx DOTFILES "$HOME/projects/dotfiles"
set -gx EDITOR nano
set -gx HOMEBREW_NO_ANALYTICS 1

set -gx DOCUMENTS_FOLDER "$HOME/Documents"
set -gx DESKTOP_FOLDER "$HOME/Desktop"
set -gx DOWNLOADS_FOLDER "$HOME/Downloads"
set -gx PROJECTS_FOLDER "$HOME/projects"
set -gx DOCKERCOMPOSE_FOLDER "$PROJECTS_FOLDER/docker-compose-files"

# Programs
set -gx BRAVE_APP "/Applications/Brave Browser.app/"
set -gx PREVIEW_APP "/System/Applications/Preview.app/"
set -gx MAIL_APP "/Applications/Microsoft Outlook.app/"
set -gx SLACK_APP "/Applications/Slack.app/"
set -gx NOTES_APP "/Applications/Notion.app/"
set -gx AI_APP "/Applications/Claude.app/"
set -gx IDE_CMD code  # cursor | code — override in $DOTFILES/local/fish/local.fish

# PATH
fish_add_path /opt/homebrew/bin
fish_add_path $DOTFILES/bin
fish_add_path $HOME/.local/bin
fish_add_path "/Applications/Cursor.app/Contents/Resources/app/bin"
fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# ASDF
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# Navigation
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias p "cd $PROJECTS_FOLDER"
alias d "cd $DOCUMENTS_FOLDER"
alias dl "cd $DOWNLOADS_FOLDER"
alias dt "cd $DESKTOP_FOLDER"

# Git
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
alias gl "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --abbrev-commit -n 20"
alias bb "open https://bitbucket.org/dashboard/repositories"
alias githelp "cat $DOTFILES/docs/git_help.txt"

# Docker
alias dup "docker compose up -d"
alias ddown "docker compose down"
alias dockerhelp "cat $DOTFILES/docs/docker_help.txt"

# Kubernetes
alias kubehelp "cat $DOTFILES/docs/kubernetes_help.txt"

# macOS
alias show "defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide "defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hidedesktop "defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop "defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias cleanupds "find . -type f -name '*.DS_Store' -ls -delete"
alias emptytrash "sudo rm -rfv ~/.Trash"
alias update "sudo softwareupdate -i -a"
alias storage "du -a * | sort -r -n | head -10"
alias frees "df -H /System/Volumes/Data"

# Shell switching
alias tofish "exec fish"
alias tozsh "exec zsh"

# Utilities
alias tree "tree -L 3"
alias treed "tree -d -L 3"

# Go
alias golatest "curl 'https://go.dev/VERSION?m=text' --silent"

function deletegolang --description 'delete golang installation'
    echo "Do you want to delete the Golang installation? y|n"
    read -l answer
    if test $answer != "y"
        echo "Abort..."
        return
    end

    set -l goroot (go env GOROOT)
    echo "Go root: $goroot"

    sudo rm -rf $goroot
    sudo rm -f /etc/paths.d/go

    echo "Golang installation removed"
end

function updategolang --description 'update golang installation'
    set -l newversion (golatest | head -n 1)

    echo "Do you want to update the Golang installation to $newversion? y|n"
    read -l answer
    if test $answer != "y"
        echo "Abort..."
        return
    end

    echo "Deleting old go version..."
    set -l goroot (go env GOROOT)
    sudo rm -rf $goroot
    sudo rm -f /etc/paths.d/go

    echo "Installing $newversion..."
    curl -OL "https://go.dev/dl/$newversion.darwin-arm64.pkg" --silent
    sudo installer -pkg $newversion.darwin-arm64.pkg -target /

    echo "Cleaning up..."
    rm "$newversion.darwin-arm64.pkg"

    echo "Golang installation updated to $newversion"
end

# Local overrides (gitignored, machine-specific)
if test -f $DOTFILES/local/fish/local.fish
    source $DOTFILES/local/fish/local.fish
end

# Starship prompt
starship init fish | source
