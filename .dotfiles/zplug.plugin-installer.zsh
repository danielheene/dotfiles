# plugin installation prompt
if ! zplug check --verbose; then
    printf "install missing plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi