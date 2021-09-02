setopt HIST_IGNORE_DUPS
setopt extended_glob

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

complete -C '/opt/homebrew/bin/aws_completer' aws

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' (%b)'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{blue}%n%f@%m:%F{red}%1~%f%F{yellow}${vcs_info_msg_0_}%f >> '

# Include custom functions file
if [ -f ~/.custom_functions ]; then
    source ~/.custom_functions
fi

# Set go path
export GOPATH=$HOME/go
export PATH="$PATH:$HOME/go/bin"
export PATH=$PATH:/usr/local/go/bin
export GO111MODULE=on

# Set HomeBrew paths
export PATH="$PATH:/opt/homebrew/bin:/opt/homebrew/sbin"

# Make git use vim
export VISUAL=vim
export EDITOR="$VISUAL"

# My Aliases
alias flushdns='sudo killall -HUP mDNSResponder'
