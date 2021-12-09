# エディターをnvimに設定
export EDITOR=nvim
# プラグイン
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

if ! zplug check --verbose; then
    printf 'Install? [y/N]: '
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# alias系
alias tf=terraform
alias k=kubectl
alias vim=nvim
alias python=python3
alias ls="ls -G -l"
alias c=clear
alias d=docker
alias dc=docker-compose
alias lg="EDITOR=nvim lazygit"


# 環境変数
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache

# tmuxをお気に入りのサイズで開く
function ide() {
  tmux split-window -v -p 40
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH=$PATH:~/.bin
