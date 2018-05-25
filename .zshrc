# EXPORTS
export DOTFILES=~/.dotfiles         # dotfile dir
export EDITOR='nano'                # setup default editor
export GPG_TTY=$(tty)               # enable prompt for gpg passphrase
export HISTFILE=~/.zsh_history      # save history to this file
export HISTSIZE=5000                # number of history lines in memory
export NVM_AUTO_USE=true            # look for .nvmrc on directoy changes
export SAVEHIST=5000                # number of history lines on disk

# ZPLUG SETUP
source ~/.zplug/init.zsh
zplug mafredri/zsh-async, from:github
zplug zsh-users/zsh-autosuggestions, from:github
zplug zsh-users/zsh-completions, from:github
zplug lukechilds/zsh-nvm, from:github
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme, if:"[[ $OSTYPE == *darwin* ]]"
zplug plugins/osx, from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
source ~/.dotfiles/zplug.plugin-installer.zsh
zplug load

# ALIASES
alias l="ls -lhG"
alias ll="ls -lhAG"
alias lsl="ls -lhFAG | less"
alias ls="ls -CFG"
alias ps="ps aux"
alias psg="ps | grep -v grep | grep -i -e VSZ -e"
alias nano='nano -w'
alias serve='http-server . -c-1'
alias bcu='brew cu -af -y'

# SETTINGS
setopt  appendhistory               # append history to $HISTFILE
setopt  sharehistory                # share history between terminals immediately
tput    rmam                        # disable line wrapping in shell output

