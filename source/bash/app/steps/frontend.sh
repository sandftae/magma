#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: handles the selection of the frontend type
# ============================================================

# frontend handles the storefront selection process
frontend() {
    local technicalValues=()
    local displayNames=()
    local choice

    # extract options
    parseKvOptions "$PLATFORM_FRONTEND_RAW_OPTIONS" displayNames technicalValues

    # render the menu
    choice=$(uiMenu "platform_frontend" "${displayNames[@]}")
    local exitCode=$?

    # handle navigation based on exit codes
    [[ $exitCode -eq 255 ]] && return 255 # Exit (Esc/Ctrl+C)
    [[ $exitCode -eq 1 ]] && return 1     # Go Back

    # find technical value
    local finalValue=""
    local i
    for i in "${!displayNames[@]}"; do
        if [[ "${displayNames[$i]}" == "$choice" ]]; then
            finalValue="${technicalValues[$i]}"
            break
        fi
    done

    # fallback value
    finalValue="${finalValue:-$FRONTEND_DEFAULT}"

    # save
    setStackData "frontend_type" "$finalValue"

    return 0
}