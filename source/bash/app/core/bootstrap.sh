#!/bin/bash
# ============================================================
# NAMESPACE: Core
# DESCRIPTION: main bootstrap file to initialize the app environment
# ============================================================

# initializes the application environment and loads all modules
appBootstrap() {
    local projectRoot
    projectRoot=$(cd "$(dirname "${BASH_SOURCE[0]}")/../../" && pwd)

    # define top-level directories to load recursively
    local components=(
        "app/utils"
        "app/ui"
        "app/core"
        "app/steps"
    )

    # execute recursive loading of all shell components
    local folder
    for folder in "${components[@]}"; do
        local targetPath="$projectRoot/$folder"
        if [[ -d "$targetPath" ]]; then
            __appLoadComponents "$targetPath" "*.sh"
        fi
    done

    # set initial config now that state functions are available
    setAppConfig "projectRoot" "$projectRoot"
    setAppConfig "stepsYamlPath" "$projectRoot/configs/menu/steps.yml"
}

# recursively finds and sources all shell scripts in a directory tree
__appLoadComponents() {
    local targetDir="$1"
    local pattern="${2:-*.sh}"

    if [[ -d "$targetDir" ]]; then
        while IFS= read -r file; do
            # check if file is readable and not empty
            if [[ -f "$file" ]]; then
                # shellcheck source=/dev/null
                source "$file"
            fi
        done < <(find "$targetDir" -type f -name "$pattern" | sort)
    fi
}