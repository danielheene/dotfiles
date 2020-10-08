export DOTFILES_DIR="${HOME}/.dotfiles"
export DOTFILES_MODULE_DIR="${DOTFILES_DIR}/modules"
export DOTFILES_VENDOR_DIR="${DOTFILES_DIR}/vendor"
[ ! -d "$DOTFILES_MODULE_DIR" ] && mkdir -p "${DOTFILES_MODULE_DIR}"
[ ! -d "$DOTFILES_VENDOR_DIR" ] && mkdir -p "${DOTFILES_VENDOR_DIR}"

DOT_MODULES=()
function dot_register() {
    DOT_MODULES=(${DOT_MODULES} $1)
}

function dot_use() {
    dot_register ${1}
    source "${DOTFILES_MODULE_DIR}/${1}/${1}.zsh"
    typeset -f module_${1}_init &>/dev/null && eval "module_${1}_init"
}

function dot_load() {
    for module in $DOT_MODULES; do
        typeset -f module_${module}_load &>/dev/null && eval "module_${module}_load"
    done
}

function dot_update() {
    for module in $DOT_MODULES; do
        typeset -f module_${module}_update &>/dev/null && eval "module_${module}_update"
    done
}

function dot_list() {
    for module in $DOT_MODULES; do
        echo ${module}
    done
}

function dot_help() {
    cat <<EOF
dot <command>

commands:
  use <module>     register an module
  load             call load method of registered modules
  update           call update method of registered modules
  list             list all registered modules
  help             show this help

Example:
  dot update
EOF
}

# dotfile management function
function dot() {
    case "$1" in
    "use")
        dot_use $2
        ;;
    "load")
        dot_load
        ;;
    "update")
        dot_update
        ;;
    "list")
        dot_list
        ;;
    *)
        dot_help
        ;;
    esac
}
