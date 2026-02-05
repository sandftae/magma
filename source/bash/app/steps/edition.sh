#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: allows user to select the platform edition
# ============================================================

# handles the platform edition selection process
edition() {
    local title="${EDITION_TITLE:-Select Edition}"
    local displayNames=()
    local technicalValues=()

    # extract labels and technical keys from raw env string
    parseKvOptions "$EDITION_RAW_OPTIONS" displayNames technicalValues

    # display menu and handle user navigation
    local choice
    choice=$(uiMenu "$title" "${displayNames[@]}") || return $?

    # find technical value matching the selected display label
    local finalValue=""
    local i
    for i in "${!displayNames[@]}"; do
        if [[ "${displayNames[$i]}" == "$choice" ]]; then
            finalValue="${technicalValues[$i]}"
            break
        fi
    done

    # ensure fallback value exists and save to stack state
    finalValue="${finalValue:-$EDITION_DEFAULT}"
    setStackData "platform_edition" "$finalValue"

    return 0
}