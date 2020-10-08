module_wallpaper_load() {
    local INSTALLED="${DOTFILES_MODULE_DIR}/wallpaper/.installed"

    if [[ ! -f ${INSTALLED} ]]; then
        npx wallpaper-cli "${DOTFILES_MODULE_DIR}/wallpaper/wallpaper.jpg" --scale=fill
        touch ${INSTALLED}
    fi
}

module_wallpaper_update() {
    npx wallpaper-cli "${DOTFILES_MODULE_DIR}/wallpaper/wallpaper.jpg" --scale=fill
}