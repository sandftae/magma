#!/bin/bash
# ============================================================
# NAMESPACE: Utils
# DESCRIPTION: generic utility to load environment files
#              (directories or specific files)
# ============================================================

# loads env files from a given dir or a single specified file
utilsLoadEnvFiles() {
    local target

  # iterate over arguments given
    for target in "$@"; do
        # is it a directory?  -> load all .*.env files inside
        if [[ -d "$target" ]]; then
            local envFile
            for envFile in "$target"/.*.env; do
                if [[ -f "$envFile" ]]; then
                    # shellcheck source=/dev/null
                    source "$envFile"
                fi
            done
        fi

        # is it a specific file -> load the file specified
        if [[ -f "$target" ]]; then
            # shellcheck source=/dev/null
            source "$target"
        fi
    done

    return 0
}