#!/usr/bin/env bash

# This file only sets the options currently in use, not the full list of
# available `defaults` keys. For more options to consider adding:
#   - https://macos-defaults.com/ (searchable, documented, categorized)
#   - https://github.com/mathiasbynens/dotfiles/blob/main/.macos (large annotated reference script)
#   - `defaults read <domain>` on a configured Mac dumps every key currently set for that domain
#   - an AI assistant can suggest defaults for a given domain/app if asked (e.g. "list useful com.apple.finder defaults keys")

# Close System Preferences to prevent overriding settings
osascript -e 'tell application "System Preferences" to quit'

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX
###############################################################################

# Expand save and print panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable predictive text
defaults write NSGlobalDomain NSAutomaticInlinePredictionEnabled -bool false

# Dark Mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable swipe between pages
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false

# Disable volume-change feedback sound
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool false

# Enable spring-loaded folders and dock, with delay
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0.5

###############################################################################
# Input
###############################################################################

# Disable "natural" scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

###############################################################################
# Energy saving
###############################################################################

sudo pmset -a lidwake 1
sudo pmset -a displaysleep 15
sudo pmset -c sleep 0
sudo pmset -b sleep 5

###############################################################################
# Screen
###############################################################################

# Require password immediately after sleep
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Screenshots as PNG
defaults write com.apple.screencapture type -string "png"

###############################################################################
# Finder
###############################################################################

# New Finder windows open to home folder
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show external drives, servers, removable media on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show hidden files, status bar, path bar
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Search current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Don't create .DS_Store on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Open new Finder window when a volume is mounted
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Use column view by default
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show ~/Library folder
chflags nohidden ~/Library
sudo chflags nohidden /Volumes

# Expand General, OpenWith, and Privileges in Get Info
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    Comments -bool true \
    General -bool true \
    MetaData -bool true \
    Name -bool true \
    OpenWith -bool true \
    Preview -bool false \
    Privileges -bool true

###############################################################################
# Dock
###############################################################################

# Show indicator lights for open apps
defaults write com.apple.dock show-process-indicators -bool true

# Don't auto-hide the Dock
defaults write com.apple.dock autohide -bool false

# Make hidden app icons translucent
defaults write com.apple.dock showhidden -bool true

# Don't show recent apps in Dock
defaults write com.apple.dock show-recents -bool false

# Hot corners: bottom-left = Launchpad, bottom-right = Desktop, top-right = Start Screen Saver
defaults write com.apple.dock wvous-bl-corner -int 11
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 5
defaults write com.apple.dock wvous-tr-modifier -int 0

# Dock icon size
defaults write com.apple.dock tilesize -int 40

###############################################################################
# Spotlight
###############################################################################

defaults write com.apple.spotlight orderedItems -array \
    '{"enabled" = 1;"name" = "APPLICATIONS";}' \
    '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
    '{"enabled" = 1;"name" = "DIRECTORIES";}' \
    '{"enabled" = 1;"name" = "PDF";}' \
    '{"enabled" = 1;"name" = "MENU_DEFINITION";}' \
    '{"enabled" = 1;"name" = "MENU_CONVERSION";}' \
    '{"enabled" = 1;"name" = "MENU_EXPRESSION";}' \
    '{"enabled" = 1;"name" = "MENU_WEBSEARCH";}' \
    '{"enabled" = 1;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}' \
    '{"enabled" = 0;"name" = "FONTS";}' \
    '{"enabled" = 0;"name" = "DOCUMENTS";}' \
    '{"enabled" = 0;"name" = "MESSAGES";}' \
    '{"enabled" = 0;"name" = "CONTACT";}' \
    '{"enabled" = 0;"name" = "EVENT_TODO";}' \
    '{"enabled" = 0;"name" = "IMAGES";}' \
    '{"enabled" = 0;"name" = "BOOKMARKS";}' \
    '{"enabled" = 0;"name" = "MUSIC";}' \
    '{"enabled" = 0;"name" = "MOVIES";}' \
    '{"enabled" = 0;"name" = "PRESENTATIONS";}' \
    '{"enabled" = 0;"name" = "SPREADSHEETS";}' \
    '{"enabled" = 0;"name" = "SOURCE";}' \
    '{"enabled" = 0;"name" = "MENU_OTHER";}'
killall mds > /dev/null 2>&1
sudo mdutil -i on / > /dev/null
sudo mdutil -E / > /dev/null

###############################################################################
# Time Machine
###############################################################################

# Prevent Time Machine from prompting for new disks
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

###############################################################################
# Activity Monitor
###############################################################################

defaults write com.apple.ActivityMonitor OpenMainWindow -bool false
defaults write com.apple.ActivityMonitor IconType -int 5
defaults write com.apple.ActivityMonitor ShowCategory -int 100

###############################################################################
# Kill affected applications
###############################################################################

for app in "Activity Monitor" "cfprefsd" "Dock" "Finder" "SystemUIServer"; do
    killall "${app}" &> /dev/null
done

echo "Done. Some changes require a logout/restart to take effect."
