# ============================================================
# NAMESPACE: UI
# DESCRIPTION: handles graceful termination message
# ============================================================

# show 'terminated' message
processTerminated() {
    trap - SIGINT SIGTERM

    # restore terminal settings (from your old version)
    stty sane 2>/dev/null

    # clear
    clear

    gum style --foreground 210 "Process terminated by user. See you next time!"

    exit 0;
}