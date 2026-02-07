#!/bin/bash
# ============================================================
# NAMESPACE: State
# DESCRIPTION: sets a value in the global stack data storage
# ============================================================

# function setStackData
setStackData() {
    local key="$1"
    local value="$2"

    __STACK_DATA["$key"]="$value"
}