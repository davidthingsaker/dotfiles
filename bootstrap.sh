#!/bin/sh

# Bootstrap file

# Ask for sudo password
sudo -v

# Install Oh My ZSH
echo "Installing ZSH"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Move my customisations into place
rm ~/.zshrc
cp zsh/.zshrc ~
cp zsh/davidthingsaker.zsh ~/.oh-my-zsh/custom
cp zsh/davidthingsaker.zsh-theme ~/.oh-my-zsh/custom/themes

# Install Homebrew, Cask and all the packages using Thoughtbots script
sh mac 2>&1 | tee ~/laptop.log

# Install Homestead for all the Laravel apps
vagrant box add laravel/homestead

# Install Composer and add to path
curl -sS https://getcomposer.org/installer | php

if [ ! -d "/usr/local/bin" ]; then
  mkdir /usr/local/bin
fi

mv composer.phar /usr/local/bin/composer

# Run the dotfiles
./dotfiles/osx/defaults.sh



