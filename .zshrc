#oh-my-zsh
ZSH=$HOME/.oh-my-zsh

DEFAULT_USER="Roxanne"
ZSH_THEME="mh"
#ZSH_THEME="agnoster"
#ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# General Aliases
alias ll="ls -l"
alias la="ls -a"
alias deploy="~/scripts/deployment_scripts/main_deploy.sh"
alias sudo="nocorrect sudo"
alias gitlog="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

source $HOME/.zsh_aliases
source $HOME/.zsh_profile
# Plugins to load, loc in  ~/.oh-my-zsh/custom/plugins/ Ex: plugins=(rails git textmate ruby lighthouse)
plugins=(git github vundle ruby rails encode64 tmux)

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/oh-my-zsh.sh

#export TERM="xterm-256color"
if [ "$TMUX" = "" ]; then tmux; fi
#PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
# HOMEBREW / GVM / REVEL
export PATH=/usr/local/bin:$PATH:/usr/local/sbin:/opt

function chpwd() {
    emulate -L zsh
      ls -a
}
#rvm
# Load rvm into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
