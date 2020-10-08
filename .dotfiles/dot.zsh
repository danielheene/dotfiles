export DOTFILES_DIR="${HOME}/.dotfiles"
export DOTFILES_MODULE_DIR="${DOTFILES_DIR}/modules"
export DOTFILES_VENDOR_DIR="${DOTFILES_DIR}/vendor"
export DOTFILES_INSTALLED_NAME=".installed"

[ ! -d "$DOTFILES_MODULE_DIR" ] && mkdir -p "${DOTFILES_MODULE_DIR}"
[ ! -d "$DOTFILES_VENDOR_DIR" ] && mkdir -p "${DOTFILES_VENDOR_DIR}"

source "$(dirname "$0")/dot/utilities.zsh"
source "$(dirname "$0")/dot/command.zsh"