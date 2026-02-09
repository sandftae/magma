#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: handles project domain
# ============================================================

# domain handles the user input for the local development domain
domain() {
    local result

    result=$(uiInput  "__validateDomain") || return $?

    # save to stack
    setStackData "domain" "${result:-$DOMAIN_DEFAULT}"
}

# __validateDomain performs domain validation
__validateDomain() {
    local input="$1"
    local check="${input:-$DOMAIN_DEFAULT}"

    # basic format checks
    [[ "$check" =~ [[:space:]] ]] && printf "No spaces allowed" && return 1
    [[ "$check" == http* ]] && printf "No 'http/https' protocol allowed" && return 1
    [[ "$check" == www.* ]] && printf "No 'www.' allowed" && return 1

    # only alphanumeric, dots, and hyphens allowed
    [[ ! "$check" =~ ^[a-zA-Z0-9.-]+$ ]] && printf "Only alphanumeric characters allowed" && return 1
    [[ ! "$check" =~ ^[a-zA-Z0-9] ]] && printf "Must start with a letter or number" && return 1
    [[ ! "$check" =~ [a-zA-Z0-9]$ ]] && printf "Must end with a letter or number" && return 1

    # suffix validation
    [[ ! "$check" == *.localhost ]] && printf "Must end with '.localhost'" && return 1

    return 0
}