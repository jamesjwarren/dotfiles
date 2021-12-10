#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Base theme for custom prompt config
ZSH_THEME=""

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Enable auto update without prompt
DISABLE_UPDATE_PROMPT="true"

# Startup message
source ~/.motd

# Google Cloud SDK
# The next line updates PATH for the Google Cloud SDK.
# Must be set before the kubectl plugin is initialised.
[[ -s "$HOME/google-cloud-sdk/path.zsh.inc" ]] && source "$HOME/google-cloud-sdk/path.zsh.inc"
# The next line enables shell command completion for gcloud.
[[ -s "$HOME/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOME/google-cloud-sdk/completion.zsh.inc"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    docker
    docker-compose
    npm
    golang
    history
    history-substring-search
    httpie
    kubectl
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Prompt setup
eval "$(starship init zsh)"

# User configuration

# Set default Editor to Vim
export EDITOR="vim"

# Golang
export GOPATH=$HOME/Go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
[[ -s "/Users/james/.gvm/scripts/gvm" ]] && source "/Users/james/.gvm/scripts/gvm"

# Direnv
if [ "$(command -v direnv)" != "" ]
then
    eval "$(direnv hook zsh)"
fi

# GPG
export GPG_TTY=$(tty)

# NVM
lazynvm() {
  unset -f nvm node npm npx
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}
nvm() {
  lazynvm
  nvm $@
}
node() {
  lazynvm
  node $@
}
npm() {
  lazynvm
  npm $@
}
npx() {
  lazynvm
  npm $@
}

# Private Aliases
[ -f $HOME/.aliases ] && source $HOME/.aliases

# Istio
export PATH="$PATH:/Users/james/Projects/istio/bin:$HOME/.istioctl/bin"

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
