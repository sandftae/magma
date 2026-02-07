#!/bin/bash
# ============================================================
# NAMESPACE: State
# DESCRIPTION: manages the configuration data storage
# ============================================================

# getStackDataKeys returns a list of all keys currently stored in the stack
getStackDataKeys() {
    if [[ ${#__STACK_DATA[@]} -gt 0 ]]; then
        echo "${!__STACK_DATA[@]}"
    fi
}