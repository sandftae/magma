#!/bin/bash
# ============================================================
# NAMESPACE: Kernel
# DESCRIPTION: retrieves step function name by index
# ============================================================

# function kernelGetStepByIndex
kernelGetStepByIndex() {
    local index="$1"

    # ensure index is valid
    [[ -z "$index" ]] || [[ "$index" -lt 0 ]] && return 1

    printf '%s' "${__APP_STEPS[$index]}"
}