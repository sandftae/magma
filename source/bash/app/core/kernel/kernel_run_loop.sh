#!/bin/bash
# ============================================================
# NAMESPACE: Kernel
# DESCRIPTION: manages the main execution loop of the application
# ============================================================

# runs the main application loop
kernelRunLoop() {
    local projectRoot
    local currentIndex=0
    local totalSteps=${#__APP_STEPS[@]}

    # get project root from global config
    projectRoot=$(getAppConfig "projectRoot")

    while [[ "$currentIndex" -lt "$totalSteps" ]] && [[ "$currentIndex" -ge 0 ]]; do
        # get current step metadata
        local stepId="${__APP_STEP_IDS[$currentIndex]}"
        local stepFunction="${__APP_STEPS[$currentIndex]}"
        local configFile="$projectRoot/app/steps/config/envs/steps/.${stepId}.env"

        # lazy load configuration
        utilsLoadEnvFiles "$configFile"

        # dynamic function call
        "$stepFunction"
        local exitCode=$?

        # handle navigation
        case "$exitCode" in
            0)   ((currentIndex++)) ;;
            1)   ((currentIndex--)) ;;
            255) processTerminated;  return 0 ;;
            *)   logError "kernel: error in $stepFunction"; return 1 ;;
        esac
    done

    setAppConfig "current_step_index" "$currentIndex"

    return 0
}