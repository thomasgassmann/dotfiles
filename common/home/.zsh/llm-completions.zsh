_gh_copilot_call() {
    local prompt="$1. Reply ONLY with valid JSON in this exact format: {\"res\": \"your_answer\"}. Do not use markdown blocks."
    
    local raw=$(gh copilot --silent --available-tools none --disable-builtin-mcps --stream off --no-color -p "$prompt" 2>/dev/null)
    
    echo "$raw" \
        | sed 's/<[^>]*>//g' \
        | sed 's/&quot;/"/g' \
        | sed "s/&#39;/'/g" \
        | grep -o '{.*}' \
        | jq -r '.res' 2>/dev/null
}

zsh_suggest() {
    [[ -z "$BUFFER" ]] && return
    
    zle -R "Asking LLM..."
    
    local clean=$(_gh_copilot_call "zsh command for: $BUFFER")
    
    if [[ -n "$clean" ]]; then
        print -s "$BUFFER"
        BUFFER="$clean"
        CURSOR=${#BUFFER}
    fi
    zle -R
}

zle -N zsh_suggest
