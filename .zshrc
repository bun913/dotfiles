# エディターをnvimに設定
export EDITOR=nvim
export VISUAL=nvim
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


# ctrl+aを使えるように
# bindkey -e
# starshipでプロンプトを改造
eval "$(starship init zsh)"
. `brew --prefix`/etc/profile.d/z.sh

# vimdiffをnvimで
alias vimdiff='nvim -d '

# Created by `pipx` on 2023-03-03 10:26:34
export PATH="$PATH:/Users/imanau/.local/bin"

# zellijのアライアス
alias ze='zellij'
alias accs='acc s --skip-filename -- --guess-python-interpreter pypy'

