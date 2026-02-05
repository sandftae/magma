#!/bin/bash
# ============================================================
# NAMESPACE: Kernel
# DESCRIPTION: handles mass loading of environment files
# ============================================================

# loads all .env files from the general configuration directory
kernelLoadGeneralConfigs() {
    local projectRoot
    projectRoot=$(getAppConfig "projectRoot")
    local generalPath="$projectRoot/app/steps/config/envs/general/"

    if [[ -d "$generalPath" ]]; then
        local envFile
        # source every .env file found in the directory
        for envFile in "$generalPath".*.env; do
            if [[ -f "$envFile" ]]; then
                # shellcheck source=/dev/null
                source "$envFile"
            fi
        done
    fi
}