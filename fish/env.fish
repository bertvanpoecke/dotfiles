## FOLDER PATHS
set -x DOCUMENTS_FOLDER "~/Documents"
set -x DESKTOP_FOLDER "~/Desktop"
set -x DOWNLOADS_FOLDER "~/Downloads"
set -x PROJECTS_FOLDER "~/projects"

## EDITOR
set -x EDITOR "nano"

## PROGRAMS
set -x BRAVE_APP "/Applications/Brave\ Browser.app/"
set -x PREVIEW_APP "/System/Applications/Preview.app/"
set -x VSCODE_APP "/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin"

## HOMEBREW
# Don’t sent analytics for Homebrew
set -x HOMEBREW_NO_ANALYTICS 1

## DOTFILES
set -x DOTFILES "$HOME/.config/fish"

## PATH
# Visual Studio Code
set PATH /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin $PATH