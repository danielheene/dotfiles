# EXPORTS
export DOTFILES="${HOME}/.dotfiles"                                             # dotfiles directory
export NVM_AUTO_USE=true                                                        # look for .nvmrc on directoy changes
export EDITOR='nano'                                                            # setup default editor
export GPG_TTY=$(tty)                                                           # enable prompt for gpg passphrase
export HISTFILE="${HOME}/.zsh_history"                                          # save history to this file
export HISTSIZE=50000                                                           # number of history lines in memory
export SAVEHIST=50000                                                           # number of history lines on disk  
export LANG=en_US.UTF-8                                                         # set language to en_US
export LC_ALL=en_US.UTF-8                                                       # set all locale values to en_US
export ICLOUD="${HOME}/Library/Mobile Documents/com~apple~CloudDocs/"           # iCloud drive folder
export PATH="$PATH:/usr/local/bin"                                              # add /usr/local/bin to path explicitly

# GO SETUP
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# MYSQL SETUP
export PATH="$PATH:/usr/local/mysql/bin"

# LOLCOMMITS SETUP
export LOLCOMMITS_DIR="${ICLOUD}/Pictures/lolcommits"

# ZPLUG SETUP
source ${HOME}/.zplug/init.zsh
zplug mafredri/zsh-async, from:github
zplug zsh-users/zsh-syntax-highlighting, from:github
zplug zsh-users/zsh-autosuggestions, from:github
zplug zsh-users/zsh-completions, from:github
zplug lukechilds/zsh-nvm, from:github
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
zplug plugins/osx, from:oh-my-zsh
source ${DOTFILES}/zplug.plugin-installer.zsh
zplug load

# ALIASES
alias git="/usr/local/bin/git"
alias l="ls -lhG"
alias ll="ls -lhAG"
alias lsl="ls -lhFAG | less"
alias ls="ls -CFG"
alias ps="tput rmam; ps aux; tput smam"
alias psg="tput rmam; ps | grep -v $@ | grep -i -e VSZ -e; tput smam"
alias nano='nano -w'
alias serve='http-server . -c-1'

# OSX ALIASES
alias trash='mvtrash'

# DOCKER ALIASES
alias dcu='docker-compose up'
alias dcr='docker-compose restart'
alias dcd='docker-compose down'

# BREW ALIASES
alias bfu="brew upgrade --fetch-HEAD --ignore-pinned"
alias bcu="brew cu --all --yes --force --cleanup"
alias bu="bfu; bcu"

# VAGRANT ALIASES
alias vu='vagrant up'
alias vup='vagrant up --provision'
alias vdu='vagrant destroy -f && rm -rf .vagrant && vagrant up --provision'

# SETTINGS
setopt HIST_FIND_NO_DUPS         # prevent entry repetition
setopt HIST_IGNORE_ALL_DUPS      # remove older duplicates
setopt HIST_IGNORE_SPACE         # ignore entries with leading space
setopt HIST_SAVE_NO_DUPS         # don't add duplicates to history
setopt HIST_VERIFY               # don't execude on history expansion
setopt INC_APPEND_HISTORY        # write immediately to history
setopt SHARE_HISTORY             # share history between sessions
