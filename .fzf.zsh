# Setup fzf
# ---------
case `uname` in
    Darwin)
        if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
            export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
        fi
        # Auto-completion
        [[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null
        # Key bindings
        source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
        ;;
    Linux)
        # Auto-completion
        [[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null
        # Key bindings
        source "/usr/share/fzf/key-bindings.zsh"
        ;;
esac
