#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: handles the selection of the platform version
# ============================================================

# version handles the platform version selection process
version() {
    # get title
    local displayNames=()
    local technicalValues=()

    # extract version labels and technical values
    parseKvOptions "$VERSION_RAW_OPTIONS" displayNames technicalValues

    # display menu and handle navigation (Back/Exit)
    local choice
    choice=$(uiMenu "version" "${displayNames[@]}")
    local exitCode=$?

    # handle navigation codes from uiMenu
    [[ $exitCode -eq 255 ]] && return 255 # Exit (Esc/Ctrl+C)
    [[ $exitCode -eq 1 ]] && return 1     # Go Back

    # find technical value by selected label
    local finalValue=""
    local i
    for i in "${!displayNames[@]}"; do
        if [[ "${displayNames[$i]}" == "$choice" ]]; then
            finalValue="${technicalValues[$i]}"
            break
        fi
    done

    # fallback
    finalValue="${finalValue:-${technicalValues[0]}}"

    # save selected version
    setStackData "platform_version" "$finalValue"

    return 0
}