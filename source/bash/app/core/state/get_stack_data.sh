#!/bin/bash
# ============================================================
# NAMESPACE: State
# DESCRIPTION: retrieves a value from the stack data storage
# ============================================================

# function getStackData
getStackData() {
    local key="$1"
    printf '%s' "${__STACK_DATA["$key"]}"
}