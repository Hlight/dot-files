# Enable Aliases to be:
# ...sudo’ed
alias sudo='sudo '
# ...cd'd
alias cd='cd '
# ...echo'd
alias echo='echo '
# ...opened in VIM text editor
alias vi='vi '

###############
### Aliases ###
###############

# Bash
alias src:bashrc="source ~/.bashrc"
alias cheatsheet:bash="cat ~/'Bash Keyboard Shortcuts.txt'"

# Localhost
alias apache:restart="sudo apache2ctl restart"
alias memcache:flush="echo 'flush_all' | nc localhost 11211"
alias memcached:flush="echo flush_all > /dev/tcp/127.0.0.1/11211"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
# alias ~="cd ~"



# Application shortcuts
alias v="vim" #open vim
alias vT="vi ./ NERDTree" #open current directory in VIM
alias g="git"
alias g:cache="git config --global credential.helper 'cache --timeout 28800'"
alias g:clear="git credential-cache exit"
alias gits="git status"
# See an ASCII art tree of all the branches, decorated with the names of tags and branches: 
alias git:log="git log --graph --oneline --decorate --all"
alias h="history"
alias hist='history | grep $1' #Requires one input
# Sublime Text
alias s="subl ." #open current directory in Sublime Text
alias s:packages="cd ~/.config/sublime-text-3/Packages; echo; echo ST3 Packages; ls -l; echo; pwd"

#alias hist='history | head -n $1' #Requires one input
# Open location in Nautilus
alias o='open '
alias oo='open .'

# SVN Subversion aliases
alias svn:diff:meld='svn diff --diff-cmd=/usr/local/bin/svn-merge-meld.sh'
alias svn:st='svn st '
alias svn:up='svn up '
alias svn:diff='svn diff '
alias svn:info='svn info '
# alias svn:propset='svn propset svn:externals . -F svn-prop.tmp'
#Requires one input file e.g. externals.trunk, externals.branch_name, externals.branch_name.tag e.g "externals.trunk.fes"
alias svn:propset='svn propset svn:externals . -F $1'
## SVN FIND
#> find . -not \( -name .svn -prune \) -type f -print0 | xargs --null grep <searchTerm>
# Search through files, ignoring .svn
# By putting the "-not \( -name .svn -prune \)" in the very front of the "find" command, you eliminate the .svn directories in your find command itself. No need to grep them out.
# You can even create an alias for this command:
#> alias svn_find="find . -not \( -name .svn -prune \)"
# Now you can do things like
#> svn_find -mtime -3
alias svn_find="find . -not \( -name .svn -prune \)"
alias svn_find_file="find . -not \( -name .svn -prune \) -type f -print0 | xargs --null grep $1"


# Changing Permissions on Files and Folders recursively.
alias chmod:files="sudo find . -type f -print0 | xargs -0 sudo chmod 644"
alias chmod:files:664="sudo find . -type f -print0 | xargs -0 sudo chmod 664"

alias chmod:folders="sudo find /path/to/Dir -type d -print0 | xargs -0 sudo chmod 755"
alias chmod:folders:775="sudo find /path/to/Dir -type d -print0 | xargs -0 sudo chmod 775"


############
# LS ALIASES
# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias dir='dir ${colorflag}'
    alias vdir='vdir ${colorflag}'

    #-------------------------------------------------------------
    # The 'ls' family (this assumes you use a recent GNU ls).
    #-------------------------------------------------------------
    # Add colors for filetype and  human-readable sizes by default on 'ls':
    alias ls='ls -h ${colorflag}'
    alias lx='ls -lXB ${colorflag}'         #  Sort by extension.
    alias lk='ls -lSr ${colorflag}'         #  Sort by size, biggest last.
    alias lt='ls -ltr ${colorflag}'         #  Sort by date, most recent last.
    alias lc='ls -ltcr ${colorflag}'        #  Sort by/show change time,most recent last.
    alias lu='ls -ltur ${colorflag}'        #  Sort by/show access time,most recent last.
    # List only directories
    alias lsd='ls -lF ${colorflag} | grep "^d"'
    alias lsad='ls -lFav ${colorflag} | grep "^d"'

    # List all files colorized in long format
    alias l="ls -CF ${colorflag}"
    # The ubiquitous 'll': directories first, with alphanumeric sorting:
    alias ll="ls -lFv --group-directories-first ${colorflag}"
    alias lm='ll |more'        #  Pipe through 'more'
    alias lr='ll -R'           #  Recursive ls.
    alias la='ll -A'           #  Show hidden files.
    alias ls:tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
    alias grep="grep ${colorflag}"
    alias fgrep="fgrep ${colorflag}"q
    alias egrep="egrep ${colorflag}"

    # LS CUSTOM COLORS
    # export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'

else
    #non-color supported ls
    alias ls='ls -h'
    alias lx='ls -lXB'
    alias lk='ls -lSr'
    alias lt='ls -ltr'
    alias lc='ls -ltcr'
    alias lu='ls -ltur'
    alias lsd='ls -lF | grep "^d"'
    alias lsad='ls -lFav | grep "^d"'
    alias l="ls -CF"
    alias ll="ls -lFv --group-directories-first"
    alias lm='ll |more'
    alias lr='ll -R'
    alias la='ll -A'
    alias ls:tree='tree -Csuh'
fi

## Tree command
alias tree="tree -CAFa -I 'CVS|*.*.package|.svn|.git' --dirsfirst"
alias treee="tree -CAfia -I 'CVS|*.*.package|.svn|.git' --dirsfirst"
#Original tree access
alias otree="tree "


# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

alias encodeURL='sed -f ~/Dropbox/url_escape.sed'
alias encodeHTML='sed -f ~/Dropbox/html_escape.sed'

### Linux Ubuntu
if [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]]; then
    # load ubuntu aliases if present
    if [ -f ~/.aliases_ubuntu ]; then
        . ~/.aliases_ubuntu
    fi
fi

#######################
### PROJECT ALIASES ###
#######################
# Big Fish Games
if [ -f ~/.bash_bfg_aliases ]; then
    . ~/.bash_bfg_aliases
fi









