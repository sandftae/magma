#!/bin/bash
# ============================================================
# NAMESPACE: Steps
# DESCRIPTION: allows user to select the platform edition
# ============================================================

# handles the platform edition selection process
edition() {
    uiStepMenu "$EDITION_RAW_OPTIONS" "platform_edition" "$EDITION_DEFAULT"
}