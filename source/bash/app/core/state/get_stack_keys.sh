#!/bin/bash
# ============================================================
# NAMESPACE: State
# DESCRIPTION: manages the configuration data storage
# ============================================================

# getStackKeys returns a list of all keys currently stored in the stack
getStackKeys() {
    if [[ ${#__STACK_DATA[@]} -gt 0 ]]; then
        echo "${!__STACK_DATA[@]}"
    fi
}