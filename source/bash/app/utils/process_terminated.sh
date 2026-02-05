# ============================================================
# NAMESPACE: UI
# DESCRIPTION: handles graceful termination message
# ============================================================

# show 'terminated' message
processTerminated() {
    trap - SIGINT SIGTERM
    local msg

    # restore terminal settings (from your old version)
    stty sane 2>/dev/null

    # clear
    clear

    msg="$(printf "%bProcess terminated by user. See you next time!%b" "${ANSI_COLOR_BOLD}" "${ANSI_COLOR_NORMAL}")"

    gum style  --margin "1 0 1 0"  --foreground "$COLOR_TERMINATE" "$msg"

    exit 0;
}