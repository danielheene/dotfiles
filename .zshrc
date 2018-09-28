# EXPORTS
export DOTFILES=~/.dotfiles
export EDITOR='nano'                # setup default editor
export GPG_TTY=$(tty)               # enable prompt for gpg passphrase
export HISTFILE=~/.zsh_history      # save history to this file
export HISTSIZE=50000               # number of history lines in memory
export NVM_AUTO_USE=true            # look for .nvmrc on directoy changes
export SAVEHIST=50000               # number of history lines on disk

# ZPLUG SETUP
source ~/.zplug/init.zsh
zplug mafredri/zsh-async, from:github
zplug zsh-users/zsh-syntax-highlighting, from:github
zplug zsh-users/zsh-autosuggestions, from:github
zplug zsh-users/zsh-completions, from:github
zplug lukechilds/zsh-nvm, from:github
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
zplug plugins/osx, from:oh-my-zsh
source $DOTFILES/zplug.plugin-installer.zsh
zplug load

# ALIASES
alias git="/usr/local/bin/git"
alias l="ls -lhG"
alias ll="ls -lhAG"
alias lsl="ls -lhFAG | less"
alias ls="ls -CFG"
alias ps="tput rmam; ps aux; tput smam"
alias psg="tput rmam; ps | grep -v grep | grep -i -e VSZ -e; tput smam"
alias nano='nano -w'
alias serve='http-server . -c-1'
alias bcu='brew cu -af -y'

# SETTINGS
setopt HIST_FIND_NO_DUPS         # prevent entry repetition
setopt HIST_IGNORE_ALL_DUPS      # remove older duplicates
setopt HIST_IGNORE_SPACE         # ignore entries with leading space
setopt HIST_SAVE_NO_DUPS         # don't add duplicates to history
setopt HIST_VERIFY               # don't execude on history expansion
setopt INC_APPEND_HISTORY        # write immediately to history
setopt SHARE_HISTORY             # share history between sessions
