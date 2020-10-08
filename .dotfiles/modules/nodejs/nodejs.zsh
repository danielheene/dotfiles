module_nodejs_nvm_install() {
    [ ! -d "$NVM_DIR" ] && git clone --depth=1 --single-branch https://github.com/nvm-sh/nvm.git ${NVM_DIR}
}

module_nodejs_nvm_update() {
    local CURRENT_DIR=$PWD
    cd ${NVM_DIR}
    git fetch --all
    git reset --hard origin/master
    cd ${CURRENT_DIR}
}

module_nodejs_nvm_hook() {
    [[ "${PWD}" == "${HOME}" ]] && return

    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

        if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
        elif [ "$nvmrc_node_version" != "$node_version" ]; then
            nvm use
        fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
        echo "Reverting to nvm default version"
        nvm use default
    fi
}

module_nodejs_nvm_hook_register() {
    autoload -U add-zsh-hook
    add-zsh-hook chpwd module_nodejs_nvm_hook
}

module_nodejs_nvm_configure() {
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

module_nodejs_yarn_global_install() {
    local CURRENT_DIR=$PWD
    local YARN_DIR=$(yarn global dir)

    rm -rf ${YARN_DIR}
    mkdir -p ${YARN_DIR}
    ln -s "${DOTFILES_MODULE_DIR}/nodejs/global-packages.json" "${YARN_DIR}/package.json"
    yarn install --non-interactive --force --update-checksums
}

module_nodejs_yarn_global_update() {
    local CURRENT_DIR=$PWD
    local YARN_DIR=$(yarn global dir)

    cd "${YARN_DIR}"
    yarn install --non-interactive --force --update-checksums
    yarn upgrade --latest
    cd "${CURRENT_DIR}"
}

module_nodejs_node_install() {
    if [ ! -x "$(command -v node)" ]; then
        nvm install 'lts/*' --default
        npm install -g npm@latest
        npm install -g yarn@latest

        module_nodejs_yarn_global_install
    fi
}

module_nodejs_node_upgrade() {
    local old_node_version=$(node --version)
    nvm install 'lts/*' --reinstall-packages-from=default --default

    [[ ! $old_node_version == "$(node --version)" ]] && module_nodejs_yarn_global_install
    [[ $old_node_version == "$(node --version)" ]] && module_nodejs_yarn_global_update
}

module_nodejs_load() {
    export NVM_DIR="${DOTFILES_VENDOR_DIR}/nvm"
    export NVM_SYMLINK_CURRENT="true"

    module_nodejs_nvm_install
    module_nodejs_nvm_configure
    module_nodejs_nvm_hook_register
    module_nodejs_node_install
}

module_nodejs_upgrade() {
    module_nodejs_nvm_update
    module_nodejs_nvm_configure
    module_nodejs_node_upgrade
}