# alias系
alias tf=terraform
alias k=kubectl
alias vim=nvim
alias python=python3
alias ls="ls -G -l"

# 環境変数
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache

# tmuxをお気に入りのサイズで開く
function ide() {
  tmux split-window -v -p 30
  tmux split-window -h -p 66
  tmux split-window -h -p 50
}
