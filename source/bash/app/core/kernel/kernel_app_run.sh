#!/bin/bash
# ============================================================
# NAMESPACE: Kernel
# DESCRIPTION: orchestrates the startup sequence
# ============================================================

# function appRun
appRun() {
    # ask for UI Mode (Gum vs Dialog)
    uiSelectMode || return 0

    # parse steps.yml to fill __APP_STEPS array
    kernelParseSteps || {
        logError "app: failed to parse steps configuration"
        return 1
    }

    # start the infinite loop
    kernelRunLoop
}