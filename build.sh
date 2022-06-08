#!/bin/bash

_remove() {
    luarocks remove vimdaloo-core --local
}

_make() {
    luarocks make --local
}

main() {
    local orig_dir=$(pwd)

    local script_file=$(realpath "${0}")
    local script_dir=$(dirname "${script_file}")
    cd "${script_dir}"

    local action="${1}"
    if [ "${action}" == "remove" ]; then
        _remove
    elif [ "${action}" == "make" ]; then
        _make
    elif [ "${action}" == "install" ]; then
        _remove
        _make
    else
        echo "./build.sh (remove | make | install)"
    fi

    cd "${orig_dir}"
}

main ${@}
