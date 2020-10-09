#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install Git with LFS
brew install git
brew install git-lfs

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget`.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install gmp

# Install common scripting languages
brew install perl
brew install php

# Set up Ruby
brew install rbenv ruby-build rbenv-default-gems rbenv-gemset
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# Set up Python
brew install python@3.7
brew install python@3.8
brew install python@3.9
echo 'export PATH="/usr/local/opt/python@3.9/libexec/bin:/usr/local/sbin:$PATH"' >> ~/.bashrc
export PATH="/usr/local/opt/python@3.9/libexec/bin:$PATH"
pip install virtualenv
pip install virtualenvwrapper

# Set up Node
brew install node
brew install nvm
brew install nodenv

# Install cloud utilities
brew install awscli
brew install curl-openssl

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
# brew install sfnt2woff-zopfli
brew install woff2

#################################################################
# Install some CTF tools; see https://github.com/ctfs/write-ups.
# Most not really needed for NetCE, but kept here for reference.
brew install bfg
brew install foremost
brew install nmap
brew install sqlmap
brew install xpdf
# brew install aircrack-ng
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install pngcheck
# brew install socat
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.

#################################################################
# Install other useful binaries.
# Most not really needed for NetCE, but kept here for reference.
brew install ack
brew install p7zip
brew install rename
brew install ssh-copy-id
brew install tree
brew install vbindiff
# brew install exiv2
# brew install imagemagick
# brew install lua
# brew install lynx
# brew install pigz
# brew install pv
# brew install rlwrap
# brew install zopfli


#################################################################
# Install various Cask software.

brew cask install adobe-acrobat-reader
brew cask install atom
brew cask install cyberduck
brew cask install docker
brew cask install firefox
brew cask install flash-npapi
brew cask install flash-ppapi
brew cask install gimp
brew cask install google-chrome
brew cask install gotomeeting
brew cask install jetbrains-toolbox
brew cask install lastpass
brew cask install libreoffice
brew cask install logitech-control-center
brew cask install microsoft-edge
brew cask install parallels
brew cask install plantronics-hub
brew cask install postman
brew cask install ringcentral
brew cask install skype-for-business
brew cask install slack
brew cask install vmware-horizon-client
brew cask install vmware-remote-console
brew cask install xerox-print-driver
brew cask install zoomus


# Remove outdated versions from the cellar.
brew cleanup
