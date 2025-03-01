# asdf settings
. /opt/homebrew/opt/asdf/libexec/asdf.sh
# Created by `pipx` on 2023-03-03 10:26:34
export PATH="$PATH:/Users/imanau/.local/bin"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
# VSCodeエディタでの設定
bindkey -e
# エディターをnvimに設定
export EDITOR=nvim
export VISUAL=nvim
# プラグイン

# alias系
alias tf=terraform
alias k=kubectl
alias vim=nvim
alias python=python3
# # ---- Eza (better ls) -----
alias cd="z"
alias c=clear
alias d=docker
alias dc=docker-compose
alias lg="EDITOR=nvim lazygit"
# atcodet test
alias test='oj t -c "python main.py" -d ./tests/'
alias accs='acc s --skip-filename -- --guess-python-interpreter pypy'
# vimdiffをnvimで
alias vimdiff='nvim -d '
alias tc="tmux clock-mode"


# 環境変数
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache


# fzf setting
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# Q post block. Keep at the bottom of this file.
# fzf-git install
source ~/fzf-git.sh/fzf-git.sh

# Amazon Q post block. Keep at the bottom of this file.
# [[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

export DAGGER_CLOUD_TOKEN=dag_bun913_WiGcEc_YtWdfHF3xczRx5rkC_MmXxrI0Zgp8faB-q5Y

