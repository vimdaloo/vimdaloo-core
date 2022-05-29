#!/bin/bash

main() {
    local orig_dir=$(pwd)

    local script_file=$(realpath "${0}")
    local script_dir=$(dirname "${script_file}")
    cd "${script_dir}"

    local action="${1}"
    if [ "${action}" == "clean" ]; then
        luarocks remove vimdaloo-core --local
    elif [ "${action}" == "install" ]; then
        luarocks make --local
    else
        echo "unknown action: ${action}"
    fi

    cd "${orig_dir}"
}

main ${@}
