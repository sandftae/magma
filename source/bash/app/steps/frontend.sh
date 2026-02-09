#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: handles the selection of the frontend type
# ============================================================

# frontend handles the storefront selection process
frontend() {
    uiStepMenu "$FRONTEND_RAW_OPTIONS" "frontend_type" "$VERSION_DEFAULT"
}