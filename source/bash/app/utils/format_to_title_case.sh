#!/bin/bash
# ============================================================
# NAMESPACE: Utils
# DESCRIPTION: text manipulation and formatting helpers
# ============================================================

# formatToTitleCase converts UPPERCASE or mixed strings to Title Case
formatToTitleCase() {
    local raw="${1:-}"
    [[ -z "$raw" ]] && return 0

    # convert everything to lowercase
    local -a words
    read -ra words <<< "${raw,,}"

    # capitalize first letter of each word and join with spaces
    printf '%s' "${words[*]^}"
}