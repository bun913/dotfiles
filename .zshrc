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
  # 左右半分にする
  tmux split-window -h
  # 左側にシェルを3つ作る
  tmux select-pane -t 0
  tmux split-window -v
  tmux split-window -v
  # 左側のリサイズ
  tmux select-pane -t 0
  tmux resize-pane -y 30
  tmux select-pane -t 1
  tmux resize-pane -y 30
  tmux select-pane -t 1
  tmux resize-pane -y 30
  tmux select-pane -t 0
}
function mini_ide() {
  # 左右半分にする
  tmux split-window -h
  # 左側にシェルを3つ作る
  tmux select-pane -t 0
  tmux split-window -v
  tmux split-window -v
  tmux split-window -v
  # 左側のリサイズ
  tmux select-pane -t 0
  tmux resize-pane -y 10
  tmux select-pane -t 1
  tmux resize-pane -y 10
  tmux select-pane -t 2
  tmux resize-pane -y 10
  # 時計を固定表示
  tmux select-pane -t 3
  tmux clock-mode
  tmux select-pane -t 0
}
# tmuxの画面分割のアライアス
alias vs="tmux split-window -h"
alias sp="tmux split-window -v"
alias clock="tmux clock-mode && tmux select-pane -t 0"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export PATH=$PATH:~/.bin
# atcodet test
alias test='oj t -c "python3 main.py" -d ./tests/'
alias py='python3 main.py'
# 現在時刻をUnixTimeStampに変換
alias uni='date -j +%s'
# Terraformの不具合修正
# https://github.com/hashicorp/terraform/issues/27350
export GODEBUG=asyncpreemptoff=1
# Goenvを利用するためのパス設定
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# vimとtmuxの移動をいい感じにする
function _left-pane() {
  tmux select-pane -L
}
zle -N left-pane _left-pane

function _down-pane() {
  tmux select-pane -D
}
zle -N down-pane _down-pane

function _up-pane() {
  tmux select-pane -U
}
zle -N up-pane _up-pane

function _right-pane() {
  tmux select-pane -R
}
zle -N right-pane _right-pane

function _backspace-or-left-pane() {
  if [[ $#BUFFER -gt 0 ]]; then
    zle backward-delete-char
  elif [[ ! -z ${TMUX} ]]; then
    zle left-pane
  fi
}
zle -N backspace-or-left-pane _backspace-or-left-pane

function _kill-line-or-up-pane() {
  if [[ $#BUFFER -gt 0 ]]; then
    zle kill-line
  elif [[ ! -z ${TMUX} ]]; then
    zle up-pane
  fi
}
zle -N kill-line-or-up-pane _kill-line-or-up-pane

function _accept-line-or-down-pane() {
  if [[ $#BUFFER -gt 0 ]]; then
    zle accept-line
  elif [[ ! -z ${TMUX} ]]; then
    zle down-pane
  fi
}
zle -N accept-line-or-down-pane _accept-line-or-down-pane

bindkey '^k' kill-line-or-up-pane
bindkey '^l' right-pane
bindkey '^h' backspace-or-left-pane
bindkey '^j' accept-line-or-down-pane

# ctrl+aを使えるように
# bindkey -e
# starshipでプロンプトを改造
eval "$(starship init zsh)"
