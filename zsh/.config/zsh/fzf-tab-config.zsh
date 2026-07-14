# keep git's own ordering (recent first) instead of alphabetical
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:git-switch:*'   sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# case-insensitive + substring matching for completions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*'

# --- rich git previews on <TAB> ------------------------------------------
# $word = the candidate under the cursor, $group = its completion group
zstyle ':fzf-tab:complete:git-(add|diff|restore|stage):*' fzf-preview \
	'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
	'git log --oneline --graph --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
	'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac'
zstyle ':fzf-tab:complete:git-(checkout|switch|rebase|merge|reset):*' fzf-preview \
	'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --oneline --graph --color=always $word ;;
	esac'
# -------------------------------------------------------------------------
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --long --header --git --icons --classify --all -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# preview nvim?
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'cat $realpath'
