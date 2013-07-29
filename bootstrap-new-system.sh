#!/usr/bin/env zsh

# A simple script for setting up OSX dev environment.

open_apps() {
  echo 'Install apps:'
  echo 'Dropbox:'
  open https://www.dropbox.com
  echo 'Chrome:'
  open https://www.google.com/intl/en/chrome/browser/
  echo 'Firefox:'
  open http://www.mozilla.org/en-US/firefox/new/
  echo 'iTerm2:'
  open http://www.iterm2.com/#/section/downloads
  echo 'Sublime Text 2'
  open http://www.sublimetext.com/2
  echo 'Alfred:'
  open http://www.alfredapp.com/#download
  echo 'VLC:'
  open http://www.videolan.org/vlc/index.html
}

echo 'Should I give you links for system applications (e.g. Chrome, ST2, VLC)?'
echo 'n / y'
read give_links
[[ "$give_links" == 'y' ]] && open_apps

echo 'Checking for SSH key, generating one if it does not exist...'
  [[ -f '~/.ssh/id_rsa.pub' ]] || ssh-keygen -t rsa

echo 'Copying public key to clipboard. Paste it into your Github account...'
  [[ -f '~/.ssh/id_rsa.pub' ]] && cat '~/.ssh/id_rsa.pub' | pbcopy
  open 'https://github.com/account/ssh'

# If we on OS X, install homebrew and tweak system a bit.
if [[ `uname` == 'Darwin' ]]; then
  which -s brew
  if [[ $? != 0 ]]; then
    echo 'Installing Homebrew...'
      ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
      brew update
      brew install ack htop ruby python vim git zsh trash
  fi

  echo 'Tweaking OS X...'
    source 'etc/osx.sh'
fi

echo 'Symlinking config files...'
  source 'bin/symlink-dotfiles.sh'

echo 'Applying sublime config...'
  st=$(pwd)/sublime/packages
  as="$HOME/Application Support/Sublime Text 2/Packages"
  # asprefs="$as/User/Preferences.sublime-settings"
  if [[ -d "$as" ]]; then
    for theme in $st/Theme*; do
      cp -r $theme $as
    done
    cp -r $st/gjl-themes $as
    for pref in $st/User; do
      rm $as/User/$pref
      ln -s "$st/User/$pref" $as/User/$pref
    done
  else
    echo "Install Sublime Text http://www.sublimetext.com"
  fi

popd
