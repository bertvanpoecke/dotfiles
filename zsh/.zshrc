export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
ZSH_DISABLE_COMPFIX=true  # skip fpath permission audit (safe on single-user Mac)
typeset -U fpath path  # deduplicate fpath/PATH — stabilizes zcompdump snapshot, prevents spurious rebuilds

plugins=(
    git
    brew
    macos
    kubectl
    helm
    docker
    z
)

source $ZSH/oh-my-zsh.sh

# Environment
export DOTFILES="$HOME/projects/dotfiles"
export EDITOR="nano"
export HOMEBREW_NO_ANALYTICS=1

# Folders
export DOCUMENTS_FOLDER="$HOME/Documents"
export DESKTOP_FOLDER="$HOME/Desktop"
export DOWNLOADS_FOLDER="$HOME/Downloads"
export PROJECTS_FOLDER="$HOME/projects"
export DOCKERCOMPOSE_FOLDER="$PROJECTS_FOLDER/docker-compose-files"

# PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$DOTFILES/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/Applications/Cursor.app/Contents/Resources/app/bin:$PATH"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# ASDF
if [ -d "$HOME/.asdf" ]; then
    export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fi

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias p="cd $PROJECTS_FOLDER"
alias d="cd $DOCUMENTS_FOLDER"
alias dl="cd $DOWNLOADS_FOLDER"
alias dt="cd $DESKTOP_FOLDER"

# Git
alias g="git"
alias gs="git status"
alias gch="git checkout"
alias gm="git merge"
alias ga="git add -A"
alias gfp="git fetch --prune"
alias gp="git pull"
alias gpp="git pull && git push"
alias gpu="git push -u origin"
alias gst="git stash"
alias gstp="git stash pop"
alias gbl="git branch -l"
alias gbd="git branch -d"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --abbrev-commit -n 20"
alias bb="open https://bitbucket.org/dashboard/repositories"
alias githelp="cat \$DOTFILES/docs/git_help.txt"

# Docker
alias dup="docker compose up -d"
alias ddown="docker compose down"
alias dockerhelp="cat \$DOTFILES/docs/docker_help.txt"

# Kubernetes
alias kubehelp="cat \$DOTFILES/docs/kubernetes_help.txt"

# macOS
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"
alias emptytrash="sudo rm -rfv ~/.Trash"
alias update="sudo softwareupdate -i -a"
alias storage="du -a * | sort -r -n | head -10"
alias frees="df -H /System/Volumes/Data"

# Shell switching
alias tofish="exec fish"
alias tozsh="exec zsh"

# Utilities
alias tree="tree -L 3"
alias treed="tree -d -L 3"

# Programs
export BRAVE_APP="/Applications/Brave Browser.app/"
export MAIL_APP="/Applications/Microsoft Outlook.app/"
export SLACK_APP="/Applications/Slack.app/"
export NOTES_APP="/Applications/Notion.app/"
export AI_APP="/Applications/Claude.app/"
export PREVIEW_APP="/System/Applications/Preview.app/"
export IDE_CMD="${IDE_CMD:-code}"  # cursor | code — override in ~/.zshrc.local

# Functions
o() { [ $# -eq 0 ] && open . || open "$@"; }
mk() { mkdir -p "$@" && cd "$@"; }
c() { [ $# -eq 0 ] && command "$IDE_CMD" . || command "$IDE_CMD" "$@"; }
office() { open "$BRAVE_APP" && open "$MAIL_APP" && open "$SLACK_APP" && open "$NOTES_APP" && open "$AI_APP"; }

# Go
alias golatest="curl 'https://go.dev/VERSION?m=text' --silent"

deletegolang() {
    echo "Do you want to delete the Golang installation? y|n"
    read answer
    [[ "$answer" != "y" ]] && echo "Abort..." && return
    local goroot=$(go env GOROOT)
    echo "Go root: $goroot"
    sudo rm -rf "$goroot"
    sudo rm -f /etc/paths.d/go
    echo "Golang installation removed"
}

updategolang() {
    local newversion=$(golatest | head -n 1)
    echo "Do you want to update the Golang installation to $newversion? y|n"
    read answer
    [[ "$answer" != "y" ]] && echo "Abort..." && return
    echo "Deleting old go version..."
    local goroot=$(go env GOROOT)
    sudo rm -rf "$goroot"
    sudo rm -f /etc/paths.d/go
    echo "Installing $newversion..."
    curl -OL "https://go.dev/dl/$newversion.darwin-arm64.pkg" --silent
    sudo installer -pkg "$newversion.darwin-arm64.pkg" -target /
    echo "Cleaning up..."
    rm "$newversion.darwin-arm64.pkg"
    echo "Golang installation updated to $newversion"
}

remote() {
    if ! command -v node &>/dev/null; then
        echo "node not installed. install with: brew install node"
        return 1
    fi
    local tool="git-remote-website-url-cli"
    local toolGithub="git+https://github.com/bertvanpoecke/git-remote-website-url-cli.git"
    if ! command -v git-remote-website-url &>/dev/null; then
        echo "$tool not found. installing now..."
        npm install -g --save "$toolGithub"
    fi
    local remoteuri website
    remoteuri=$(git remote get-url --all origin)
    website=$(git-remote-website-url "$remoteuri")
    [[ -n "$website" ]] && open "$website/commits"
}

# Numpad key bindings
bindkey -s "^[Op" "0"
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

# zsh-autosuggestions
[[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting (must be last plugin)
[[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Local overrides (gitignored, machine-specific)
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

# Starship prompt
eval "$(starship init zsh)"
