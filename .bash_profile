# Define some colours and setup PS1
RESET="\[\033[0m\]"
RED="\[\033[31;1m\]"
GREEN="\[\033[0m\]"
BLUE="\[\033[34m\]"
YELLOW="\[\033[38;5;142m\]"
PS1="${BLUE}\u${RESET}@\h:${RED}\W ${YELLOW}\$(__git_ps1 '(%s)')${RESET}$ "

complete -C '/usr/local/bin/aws_completer' aws

export HISTCONTROL=ignoreboth:erasedups

# Git auto complete
GIT_PATH='/Applications/Xcode-10.app/Contents/Developer/usr/share/git-core'
git_prompt="$GIT_PATH/git-prompt.sh"
[[ -r $git_prompt ]] && source $git_prompt
git_complete="$GIT_PATH/git-completion.bash"
[[ -r $git_complete ]] && source $git_complete

# Include custom functions file
if [ -f ~/.custom_functions ]; then
  source ~/.custom_functions
fi

# Adding paths to usefull tools
MY_TOOLS=`ls -F $HOME/Documents/Tools/ | grep "\/" `
for EACH_TOOL in $MY_TOOLS; do
  PATH="$PATH:$HOME/Documents/Tools/$EACH_TOOL"
done

# Command to upgrade all pip packages
alias pipupgradeall="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip install -U"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set go path
export GOPATH=$HOME/go
PATH="$PATH:$HOME/go/bin"
