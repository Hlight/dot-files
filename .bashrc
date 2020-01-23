[ -n "$PS1" ] && source ~/.bash_profile
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/aotrowsky/Code/lululemon/Booking-Details/wae-booking-details/node_modules/tabtab/.completions/serverless.bash ] && . /Users/aotrowsky/Code/lululemon/Booking-Details/wae-booking-details/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/aotrowsky/Code/lululemon/Booking-Details/wae-booking-details/node_modules/tabtab/.completions/sls.bash ] && . /Users/aotrowsky/Code/lululemon/Booking-Details/wae-booking-details/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/aotrowsky/Code/lululemon/Booking-Details/wae-booking-details/node_modules/tabtab/.completions/slss.bash ] && . /Users/aotrowsky/Code/lululemon/Booking-Details/wae-booking-details/node_modules/tabtab/.completions/slss.bash