# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders app hero section
# ============================================================

# uiRenderAppHeroHeader displays app hero section
uiRenderAppHeroHeader() {
    # hero section
    gum style \
          --foreground "$COLOR_PRIMARY" \
          --border double \
          --border-foreground "$COLOR_ACCENT" \
          --align center --width 60 --margin "1 2" --padding "0 1" \
          "$APP_TITLE"
}