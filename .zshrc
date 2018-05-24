# EXPORTS
export EDITOR='nano'
export GPG_TTY=$(tty)
export NVM_AUTO_USE=true

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

# ZPLUG
source ~/.zplug/init.zsh
zplug mafredri/zsh-async, from:github
zplug zsh-users/zsh-autosuggestions, from:github
zplug zsh-users/zsh-completions, from:github
zplug lukechilds/zsh-nvm, from:github
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
zplug load

# OTHERS
tput rmam       #disable line wrapping

