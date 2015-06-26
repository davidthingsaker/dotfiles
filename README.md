***At the moment this stuff is all completely untested***

Mac
===

This is an amalgamation of dotfiles and [Thoughtbots Laptop script](https://github.com/thoughtbot/laptop). Most of the credit should go to them. I have tried to keep their laptop section intact in the `laptop` directory.

Bootstrap
---------
The idea of the bootstrap script is to run all the other stuff in turn so that you only have to run one script.

The script runs a little like this:

1. Installs oh my zsh, then copies the customisations over from the `zsh` directory.
2. Runs Thoughtbots script to install all the [Homebrew](http://brew.sh) and [Cask](http://caskroom.io) packages and apps.
3. Install [Homestead](http://laravel.com/docs/5.1/homestead), a vagrant box by Laravel.
4. Installs [composer](http://laravel.com/docs/5.1/homestead)
5. Runs the dotfiles
