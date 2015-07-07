#!/bin/sh

brew_tap 'caskroom/cask'
brew_install_or_upgrade 'brew-cask'

brew cask install dropbox
brew cask install google-chrome
brew cask install firefox
# brew cask install transmit # license required MAS App
brew cask install smcfancontrol
# brew cask install divvy # license required MAS App
brew cask install tower # license required
brew cask install phpstorm # license required
brew cask install sublime-text
brew cask install evernote
brew cask install vyprvpn
# brew cask install 1password # license required MAS App
# brew cask install bartender # license required MAS App
brew cask install chrome-remote-desktop-host
brew cask install vlc
brew cask install virtualbox
brew cask install vagrant
brew cask install skype
# brew cask install daisydisk # license required MAS App
brew cask install keka
brew cask install sequel-pro

brew cask install sonarr
brew cask install sabnzbd
brew cask install couchpotatoserver
brew cask install torbrowser
brew cask install transmission
brew cask install plex-media-server
brew cask install plex-home-theater


brew_install_or_upgrade 'tree'
brew_install_or_upgrade 'watch'
