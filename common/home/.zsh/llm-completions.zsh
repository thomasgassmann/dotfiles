_claude_call() {
    claude -p \
        --model haiku \
        --tools "" \
        --strict-mcp-config \
        --disable-slash-commands \
        --no-session-persistence \
        --system-prompt 'You output exactly one zsh command and nothing else. No markdown, no explanation.' \
        "$1" 2>/dev/null \
        | sed -e '/^```/d' -e 's/^`//' -e 's/`$//'
}

zsh_suggest() {
    [[ -z "$BUFFER" ]] && return

    zle -R "Asking LLM..."

    local clean=$(_claude_call "zsh command for: $BUFFER")

    if [[ -n "$clean" ]]; then
        print -s "$BUFFER"
        BUFFER="$clean"
        CURSOR=${#BUFFER}
    fi
    zle -R
}

zle -N zsh_suggest
