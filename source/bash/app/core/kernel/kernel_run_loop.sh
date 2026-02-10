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
        local step="${__APP_STEPS[$currentIndex]}"
        local configFile="$projectRoot/app/steps/config/envs/steps/.${stepId}.env"

        # set current step context
        setAppConfig "step" "$step"

        # lazy load configuration
        utilsLoadEnvFiles "$configFile"

        # re-set headers if it is not dialog
        [[ "$(getAppConfig "uiMode")" != "dialog" ]] && uiStepHeaders

        # dynamic function call
        "$step"
        local exitCode=$?

        # handle navigation
        case "$exitCode" in
            0)          ((currentIndex++)) ;;
            1)          ((currentIndex--)) ;;
            10)         currentIndex=$totalSteps ;;
            255 | 130)  processTerminated; return 0 ;;
            *)          logError "kernel: error in $step"; return 1 ;;
        esac
    done

    setAppConfig "current_step_index" "$currentIndex"

    return 0
}