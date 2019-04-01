# dot-files setup

Requirements:

- bash
- zsh
- oh-my-zsh
	Must install fresh copy of oh-my-zsh into home directory.
	Then copy custom plugins found in this repo/.oh-my-zsh/custom/plugins/
	- custom plugins
	Also need custom cobalt2-ao.theme found in repo/.oh-my-zsh/themes/
- powerline fonts
	- install powerline fonts (found in this repo)
	- select powerline font in Terminal, iTerm2 perferences.
- dircolors
	- required for fancy ls colors.

The following symlinks are required in user directory:

```shell
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

```