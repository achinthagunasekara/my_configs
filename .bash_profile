# Define some colours
RESET="\[\017\]"
RED="\[\033[31;1m\]"
GREEN="\[\033[0m\]"
BLUE="\[\033[34m\]"
YELLOW="\[\033[33;1m\]"

complete -C '/usr/local/bin/aws_completer' aws

export HISTCONTROL=ignoreboth:erasedups

git_prompt=/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
[[ -r $git_prompt ]] && source $git_prompt
git_complete=/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
[[ -r $git_complete ]] && source $git_complete

PS1="${BLUE}\u${GREEN}@\h:${RED}\W ${YELLOW}\$(__git_ps1 '(%s)')${GREEN}$ "

# Custom Functions
if [ -f ~/.custom_functions ]; then
  source ~/.custom_functions
fi

PATH=$PATH:/Users/achinthag/Documents/Software/apache-maven-3.3.9/bin/
PATH=$PATH:/Users/achinthag/Documents/Software/packer-1.1.2
PATH=$PATH:/usr/local/mysql/bin
