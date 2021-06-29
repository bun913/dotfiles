# Vim チートシート

## 基本操作ショートカット

ctrl + s でファイルを保存できるようにしている

## コードレビュー

```bash
# main/masterブランチからチェックアウト
git fetch
git pull origin
git checkout -b review
git merge --no-commit --no-ff ${レビューするブランチ}
git reset
```

## ファイル横断検索

### far.vim

ファイル横断検索・置換用のプラグイン

ctrl + f でファイル検索モード
ctrl + g で置換モード

`:Far org 変更後 **/*.py` のように実行

t で除外するファイルを選択して f で一括置換してくれる

### LeaderF

fzf 系のプラグイン

;f でファイル検索モード
tab でファイルを選べる

t で新規タブで開く
ender でその場で開く
v で横分割で開く

### 初期機能

カレントディレクトリ配下から検索する
`:vimgrep 検索ワード **/*` | cw

検索結果を含むファイルの結果を表示
`:copen`

検索結果を別のウインドウで開く
:cw

検索からの置換
`:cdo %s/org/ORG/gc | update`

## vim-suurond

範囲選択 S "" でダブルクオートで囲む

## coc.nvim

\<Space\>fm でフォーマッター適用

## ファイラー操作

Ctrl + n でファイラーを開く

`o` でファイルを開くときに新しいタブで開く
`l` でファイルを開くときに分割して開く

`N`で新規ファイルを作成
`M`で新規ディレクトリを作成
`d`でファイル・フォルダの削除
`r`でリネーム

## MarkdownPrview

:MP でマークダウンのプレビューを開く

## TODO 管理

### TODO 操作

`Space i`で今の行に新規 TODO を追加する
`Space Enter`でタスクを終了済みにする
`Space u`でタスクを未終了に戻す
