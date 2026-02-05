#!/bin/bash
# ============================================================
# NAMESPACE: Kernel
# DESCRIPTION: orchestrates the startup sequence with UI re-selection
# ============================================================

# starts the application
appRun() {
    # parse steps.yml once
    kernelParseSteps || {
        logError "app: failed to parse steps configuration"
        return 1
    }

    while :; do
        local lastIndex=""
        local totalSteps=""

        # ask for UI Mode (Gum vs Dialog)
        uiSelectMode || break

        # start the main execution loop
        kernelRunLoop

        totalSteps=${#__APP_STEPS[@]}
        lastIndex=$(getAppConfig "current_step_index")
        # if it finished all steps (index >= totalSteps) => exit the app
        if [[ "$lastIndex" -ge "$totalSteps" ]]; then
            break
        fi
    done
}