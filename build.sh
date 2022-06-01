#!/bin/bash

_clean() {
    luarocks remove vimdaloo-core --local
}

_install() {
    luarocks make --local
}

main() {
    local orig_dir=$(pwd)

    local script_file=$(realpath "${0}")
    local script_dir=$(dirname "${script_file}")
    cd "${script_dir}"

    local action="${1}"
    if [ "${action}" == "clean" ]; then
        _clean
    elif [ "${action}" == "install" ]; then
        _install
    else
        _clean
        _install
    fi

    cd "${orig_dir}"
}

main ${@}
