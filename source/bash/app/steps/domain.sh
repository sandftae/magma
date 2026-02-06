#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: handles project domain
# ============================================================

# domain handles the user input for the local development domain
domain() {
    local title
    local result
    local title="${DOMAIN_MENU_TITLE:-Project Domain}"

    result=$(uiInput "$title" "$DOMAIN_DEFAULT" "__validateDomain")
    local exitCode=$?

    # handle Escape/Cancel
    [[ $exitCode -eq 255 ]] && return 255
    # Handle Back (for Dialog mode)
    [[ $exitCode -eq 1 ]] && return 1

    # save to stack
    setStackData "project_domain" "${result:-$DOMAIN_DEFAULT}"

    return 0
}

# __validateDomain performs domain validation
__validateDomain() {
    local input="$1"
    # set default if empty for validation purposes
    local check="${input:-$DOMAIN_DEFAULT}"

    [[ "$check" =~ [[:space:]] ]] && printf "No spaces allowed" && return 1
    [[ "$check" == http* ]] && printf "No protocol allowed" && return 1
    [[ "$check" == https* ]] && printf "No protocol allowed" && return 1
    [[ "$check" == www.* ]] && printf "No 'www.' allowed" && return 1
    [[ ! "$check" == *.localhost ]] && printf "Must end with .localhost" && return 1

    return 0
}