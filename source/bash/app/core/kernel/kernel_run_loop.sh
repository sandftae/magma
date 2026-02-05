#!/bin/bash
# ============================================================
# NAMESPACE: Kernel
# DESCRIPTION: manages the main execution loop of the application
# ============================================================

# runs the main application loop
kernelRunLoop() {
    local currentIndex=0
    local totalSteps=${#__APP_STEPS[@]}

    while [[ "$currentIndex" -lt "$totalSteps" ]] && [[ "$currentIndex" -ge 0 ]]; do
        # get current step metadata
        local stepId="${__APP_STEP_IDS[$currentIndex]}"
        local stepFunction="${__APP_STEPS[$currentIndex]}"

        # lazy load configuration
        kernelLoadStepConfig "$stepId"

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

    return 0
}