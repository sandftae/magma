#!/bin/bash
# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders step headers
# ============================================================

# uiStepHeaders show default step headers
uiStepHeaders() {
    # clear just a little bit
    clear

    # render hero section
    uiRenderAppHeroHeader
    uiRenderExitHint
}
