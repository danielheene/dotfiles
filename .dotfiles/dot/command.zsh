DOT_MODULES=()
function dot_register() {
    DOT_MODULES=(${DOT_MODULES} $1)
}

function dot_install() {
    dot_register ${1}
    source "${DOTFILES_MODULE_DIR}/${1}/${1}.zsh"
    typeset -f module_${1}_install &>/dev/null && eval "module_${1}_install"
}

function dot_load() {
    for module in $DOT_MODULES; do
        typeset -f module_${module}_load &>/dev/null && eval "module_${module}_load"
    done
}

function dot_upgrade() {
    for module in $DOT_MODULES; do
        typeset -f module_${module}_upgrade &>/dev/null && eval "module_${module}_upgrade"
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
  install <module>    install and register a module
  load                call load function of register modules
  upgrade             call upgrade function of registered modules
  list                list all registered modules
  help                show this help

Example:
  dot update
EOF
}

# dotfile management function
function dot() {
    case "$1" in
    "install")
        dot_install $2
        ;;
    "load")
        dot_load
        ;;
    "upgrade")
        dot_upgrade
        ;;
    "list")
        dot_list
        ;;
    *)
        dot_help
        ;;
    esac
}
