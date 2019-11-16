# git alias's
git config --global alias.co checkout; 
git config --global alias.br branch; 
git config --global alias.ci commit; 
git config --global alias.st status; 
# Reset staged files.
git config --global alias.unstage 'reset HEAD --'; 
# See last commit message
git config --global alias.last 'log -1 HEAD'; 
# Open Sublime Merge at current directory e.g. git visual
git config --global alias.visual '!smerge .';

# diff so fancy
git config --global alias.diffancy '!f() { [ -z "$GIT_PREFIX" ] || cd "$GIT_PREFIX" && git diff --color "$@" | diff-so-fancy  | less --tabs=4 -RFX; }; f';

git config --global color.ui true; 
git config --global color.diff-highlight.oldNormal    "red bold"; 
git config --global color.diff-highlight.oldHighlight "red bold 52"; 
git config --global color.diff-highlight.newNormal    "green bold"; 
git config --global color.diff-highlight.newHighlight "green bold 22"; 
git config --global color.diff.meta       "yellow"; 
git config --global color.diff.frag       "magenta bold"; 
git config --global color.diff.commit     "yellow bold"; 
git config --global color.diff.old        "red bold"; 
git config --global color.diff.new        "green bold"; 
git config --global color.diff.whitespace "red reverse"; 
git config --global alias.logGraph "log --graph --decorate --pretty=oneline --abbrev-commit";
