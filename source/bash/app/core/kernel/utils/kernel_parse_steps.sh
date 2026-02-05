#!/bin/bash
# shellcheck disable=SC2034
# ============================================================
# NAMESPACE: Kernel
# DESCRIPTION: parses steps.yml into internal arrays
# ============================================================

kernelParseSteps() {
    local yamlPath
    yamlPath=$(getAppConfig "stepsYamlPath")

    # check dependencies
    command -v yq >/dev/null 2>&1 || return 1

    # fill step IDs
    mapfile -t __APP_STEP_IDS < <(yq e '.steps[].id' "$yamlPath")

    # fill step functions
    mapfile -t __APP_STEPS < <(yq e '.steps[].step' "$yamlPath")

    return 0
}