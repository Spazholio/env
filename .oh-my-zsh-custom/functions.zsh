# #!/bin/zsh
which fzf &> /dev/null
if [ $? -eq 0 ]; then
  echo "git status exited successfully"
else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install --no-fish --key-bindings --completion --no-update-rc
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

rf() {
    RG_PREFIX="rga --files-with-matches"
    local file
    file="$(
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
            fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
                --phony -q "$1" \
                --bind "change:reload:$RG_PREFIX {q}" \
                --preview-window="70%:wrap"
    )" &&
    echo "opening $file" &&
    open "$file"
}
