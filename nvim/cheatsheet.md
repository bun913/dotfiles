# Vim チートシート

## ファイル横断検索

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

<Space>fm でフォーマッター適用
