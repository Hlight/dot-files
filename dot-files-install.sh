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
# Install Yarn node package manager
brew install yarn
# Install diff-so-fancy
npm install -g diff-so-fancy
# Install pnpm (effecient package manager)
npm install -g pnpm
pnpm add -g pnpm # update pnpm after above install
# Install rmtrash (we alias rm to this so stuff gets put into the trash see alias's)
brew install rmtrash
# Install git-extras 
# https://github.com/tj/git-extras/blob/master/Installation.md
brew install git-extras


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

# Below symlinks requires Dropbox Installed with dot-files repo in ~/Code/github/Hlight/ location.
# ".gitconfig-commit" must be updated and renamed to .gitconfig
ln -s ~/Code/github/Hlight/dot-files/.gitconfig ~/.gitconfig;
# dir_colors needed for colored file output using ls
ln -s ~/Code/github/Hlight/dot-files/dircolors.256dark ~/.dir_colors;
# bash rc file
ln -s ~/Code/github/Hlight/dot-files/.bashrc ~/.bashrc;
# zsh rc file
ln -s ~/Code/github/Hlight/dot-files/.zshrc ~/.zshrc;
# zsh & bash shared profile, aliases and functions. 
ln -s ~/Code/github/Hlight/dot-files/.profile ~/.profile;
ln -s ~/Code/github/Hlight/dot-files/.aliases ~/.aliases;
ln -s ~/Code/github/Hlight/dot-files/.functions ~/.functions;
# bash 
ln -s ~/Code/github/Hlight/dot-files/.bash_prompt_alex ~/.bash_prompt;
ln -s ~/Code/github/Hlight/dot-files/.bash_profile ~/.bash_profile;
ln -s ~/Code/github/Hlight/dot-files/.bash_aliases ~/.bash_aliases;
ln -s ~/Code/github/Hlight/dot-files/.bash_osx_aliases ~/.bash_osx_aliases;
ln -s ~/Code/github/Hlight/dot-files/.bash_exports ~/.bash_exports;
ln -s ~/Code/github/Hlight/dot-files/.bash_functions ~/.bash_functions;
ln -s ~/Code/github/Hlight/dot-files/.bash_history ~/.bash_history;

# Install smerge command via sylink to SublimeMerge app (https://www.sublimemerge.com/docs/command_line): requires ~/bin/ directory
ln -s "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge" ~/bin/smerge
