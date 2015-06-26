#!/bin/sh

# Bootstrap file

# Ask for sudo password
sudo -v

homestead_is_upgradable() {
    echo 'Checking if you are running latest version of Homestead'
    vagrant box update --box laravel/homestead | grep -q "latest version"
}

homestead_is_installed() {
    echo 'Checking if Homestead is already installed'
    vagrant box list | grep -q "homestead"
}

install_oh_my_zsh() {
    echo 'Installing Oh My ZSH'
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

# Install Oh My ZSH
# First check you have ZSH, if you're on Mac OS X you should already have it
if type zsh > /dev/null; then
    echo 'You have ZSH installed already'
    if [ ! -d ~/.oh-my-zsh ]; then
        install_oh_my_zsh
    else
        echo 'Looks like you already have Oh My ZSH installed as well'
    fi
else
    echo "Installing ZSH"
    apt-get install zsh
    install_oh_my_zsh
fi

echo "Moving ZSH customisations into place"
Move my customisations into place
rm ~/.zshrc
cp zsh/.zshrc ~
cp zsh/davidthingsaker.zsh ~/.oh-my-zsh/custom
cp zsh/davidthingsaker.zsh-theme ~/.oh-my-zsh/custom/themes

echo "Running the Thoughtbot script and .laptop.local"
echo "This will install all the apps"
# Install Homebrew, Cask and all the packages using Thoughtbots script
sh laptop/mac 2>&1 | tee ~/laptop.log

echo "Installing Homestead"
# Install Homestead for all the Laravel apps
if homestead_is_installed; then
    if homestead_is_upgradable; then
        echo 'Upgrading the homestead box to latest version'
        vagrant box update --box laravel/homestead
    else
        echo 'You are already running the most upto date version. Have a beer! \xF0\x9f\x8d\xba'
    fi
else
    vagrant box add laravel/homestead
fi

if type composer > /dev/null; then
    echo 'Looks like you already have composer installed'
    sudo /usr/bin/composer self-update
else
    echo "Installing Composer"
    Install Composer and add to path
    curl -sS https://getcomposer.org/installer | php

    echo "Adding composer to PATH"
    According to composers notes, Yosemite does not have /usr/local/bin by default. Check and create it if not.
    if [ ! -d /usr/local/bin ]; then
      mkdir /usr/local/bin
    fi

    mv composer.phar /usr/local/bin/composer
fi

echo "Running the dotfiles"
# Run the dotfiles
sh dotfiles/osx/defaults.sh



