# ============================================================
# NAMESPACE: UI
# DESCRIPTION: renders a  exit hint for the user
# ============================================================

# uiRenderExitHint displays a dimmed keyboard shortcut guide
uiRenderExitHint() {
    # just renders hint
    gum style --margin "0 0 1 3" --foreground "243" \
        "$(printf "Hint: press %bESC%b to go %bback%b or %bCTRL+C%b to %bexit%b" \
        "${ANSI_COLOR_BOLD}" "${ANSI_COLOR_NORMAL}${ANSI_COLOR_DIM}" \
        "${ANSI_COLOR_BOLD}" "${ANSI_COLOR_NORMAL}${ANSI_COLOR_DIM}" \
        "${ANSI_COLOR_BOLD}" "${ANSI_COLOR_NORMAL}${ANSI_COLOR_DIM}" \
        "${ANSI_COLOR_BOLD}" "${ANSI_COLOR_NORMAL}${ANSI_COLOR_DIM}")"
}