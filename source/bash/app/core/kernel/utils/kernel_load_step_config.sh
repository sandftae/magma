#!/bin/bash
# ============================================================
# NAMESPACE: Kernel
# DESCRIPTION: lazy-loads step-specific environment variables
# ============================================================

# load config for a specific step
kernelLoadStepConfig() {
    local stepId="$1"
    local projectRoot

    # get project root from global config
    projectRoot=$(getAppConfig "projectRoot")

    # build path to config file (filenames are lowercase)
    local configFile="$projectRoot/app/steps/config/envs/steps/.${stepId}.env"

    # source file if it exists
    if [[ -f "$configFile" ]]; then
        # shellcheck source=/dev/null
        source "$configFile"
        logDebug "kernel: [${stepId}] configuration loaded"
    fi

    return 0
}