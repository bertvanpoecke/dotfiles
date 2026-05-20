## FOLDER PATHS
set -x DOCUMENTS_FOLDER "~/Documents"
set -x DESKTOP_FOLDER "~/Desktop"
set -x DOWNLOADS_FOLDER "~/Downloads"
set -x PROJECTS_FOLDER "~/projects"
set -x DOCKERCOMPOSE_FOLDER "$PROJECTS_FOLDER/docker-compose-files"

## EDITOR
set -x EDITOR "nano"

## PROGRAMS
set -x BRAVE_APP "/Applications/Brave Browser.app/"
set -x PREVIEW_APP "/System/Applications/Preview.app/"
set -x VSCODE_APP "/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin"
set -x MAIL_APP "/Applications/Microsoft Outlook.app/"
set -x SLACK_APP "/Applications/Slack.app/"
set -x NOTES_APP "/Applications/Notion.app/"
set -x AI_APP "/Applications/Claude.app/"

## HOMEBREW
# Don’t sent analytics for Homebrew
set -x HOMEBREW_NO_ANALYTICS 1

## FISHDOTFILES
set -x FISHDOTFILES (readlink $HOME/.config/fish)
## DOTFILES
set -x DOTFILES (dirname $FISHDOTFILES)

## PATH
# Make personal utilities available
set PATH $DOTFILES/bin $PATH
# Visual Studio Code
set PATH /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin $PATH
# Homebrew
set PATH /opt/homebrew/bin $PATH
# Local bin
set PATH ~/.local/bin $PATH