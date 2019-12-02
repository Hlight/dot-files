# dot-files install script

#-----------------------------
# External Download & Installs
#-----------------------------

# Install Oh-My-Zsh (zsh shell https://ohmyz.sh/) 
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Node Version Manager (NVM)
curl -o- https://raw.githubusercontent.com
/nvm-sh/nvm/v0.35.1/install.sh | bash

# Home brew install
# Shortcut: install the latest XCode and then run the following command to install:
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Then add the following line to your .bashrc or .zshrc (this line should already be in dot-files .bashrc & .zshrc files)
# $ export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

# Install GNU coreutils
# https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/
brew install coreutils


#----------------------
# Local copy & symlinks 
#----------------------

# Install powerline fonts
./powerline/fonts/install.sh
# VSCode Powerline Setting:
# "terminal.integrated.fontFamily": "Source Code Pro for Powerline",
# iTerm2 Setting:
# iTerm2 > Preferences > Profile > Text > Font: "Source Code Pro for Powerline"
# Terminal Setting:
# Terminal > Preferences > Pro (default) > Font: "Source Code Pro for Powerline" > Size 14pt

# Copy custom zsh theme:
cp -r oh-my-zsh-custom/custom/themes/cobalt2-ao.zsh-theme ~/.oh-my-zsh/custom/themes/
# Copy custom zsh plugins:
cp -r oh-my-zsh-custom/custom/plugins/git-open  ~/.oh-my-zsh/custom/plugins/
cp -r oh-my-zsh-custom/custom/plugins/zsh-syntax-highlighting  ~/.oh-my-zsh/custom/plugins/
cp -r oh-my-zsh-custom/custom/plugins/zsh-syntax-highlighting-filetypes  ~/.oh-my-zsh/custom/plugins/

# Below symlinks requires Dropbox Installed with dot-files repo in ~/Dropbox/Aaron/Terminal\ Extras/ location.
# ".gitconfig-commit" must be updated and renamed to .gitconfig
ln -s ~/Dropbox/Aaron/Terminal\ Extras/dot-files/.gitconfig ~/.gitconfig;
# dir_colors needed for colored file output using ls
ln -s ~/Dropbox/Aaron/Terminal\ Extras/dot-files/dircolors.256dark ~/.dir_colors;
# bash rc file
ln -s ~/Dropbox/Aaron/Terminal\ Extras/dot-files/.bashrc ~/.bashrc;
# zsh rc file
ln -s ~/Dropbox/Aaron/Terminal\ Extras/dot-files/.zshrc ~/.zshrc;
# zsh & bash shared profile, aliases and functions. 
ln -s ~/Dropbox/Aaron/Terminal\ Extras/dot-files/.profile ~/.profile;
ln -s ~/Dropbox/Aaron/Terminal\ Extras/dot-files/.aliases ~/.aliases;
ln -s ~/Dropbox/Aaron/Terminal\ Extras/dot-files/.functions ~/.functions;
# bash 
ln -s ~/Dropbox/Aaron/Terminal\ Extras/dot-files/.bash_prompt_alex ~/.bash_prompt;
ln -s ~/Dropbox/Aaron/Terminal\ Extras/dot-files/.bash_profile ~/.bash_profile;
ln -s ~/Dropbox/Aaron/Terminal\ Extras/dot-files/.bash_aliases ~/.bash_aliases;
ln -s ~/Dropbox/Aaron/Terminal\ Extras/dot-files/.bash_osx_aliases ~/.bash_osx_aliases;
ln -s ~/Dropbox/Aaron/Terminal\ Extras/dot-files/.bash_exports ~/.bash_exports;
ln -s ~/Dropbox/Aaron/Terminal\ Extras/dot-files/.bash_functions ~/.bash_functions;
ln -s ~/Dropbox/Aaron/Terminal\ Extras/dot-files/.bash_history ~/.bash_history;

