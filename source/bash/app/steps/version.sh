#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: handles the selection of the platform version
# ============================================================

# version handles the platform version selection process
version() {
    uiStepMenu "$VERSION_RAW_OPTIONS" "platform_version" "$VERSION_DEFAULT"
}