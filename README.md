Vim Starter-Kit
===================================

    .vimrc
    .vim
    ├── autoload
    │   └── pathogen.vim
    ├── bundle
    │   ├── gundo.vim
    │   ├── jslint.vim
    │   ├── neocomplcache
    │   ├── nerdtree
    │   ├── snipmate.vim
    │   ├── vim-alignta
    │   ├── vim-css3-syntax
    │   ├── vim-fontzoom
    │   ├── vim-qfreplace
    │   ├── vim-surround
    │   └── zencoding-vim
    ├── colors
    │   └── ir_black.vim
    └── ftplugin
        └── html.vim

1. Macならホームディレクトリ(~/)に。
   WinならGVimフォルダ内のvimfilesにコピったり、\_vimrcとして設置してください。
2. プラグインを追加するときはbundleフォルダに新規フォルダを追加して、その中に入れてください。

※プラグインはPathogenで管理しています。


## キーマップ

(練習用)十字キーの封印
(練習用)&lt;C-c&gt;の封印

bp 1つ前のバッファに切替
bn 1つ次のバッファに切替
bd 現在のバッファを削除

gc 直前に編集したテキストを再選択（ヤンクしたテキストなど）

&lt;Space-r&gt; 表示中のファイルをリロード(VimScript)
&lt;Space-v&gt; .vimrcと.gvimrcをリロード
&lt;Space-,&gt; .vimrcに切替
&lt;Space-.&gt; .gvimrcに切替

:CD 現在ファイルの階層に移動
:Utf8 utf-8で再読込
:Sjis sjisで再読込
:Euc euc-jpで再読込

&lt;Esc&gt;&lt;Esc&gt; 検索ハイライトを解除

&lt;F3&gt; NERDTree起動
&lt;F5&gt; Gundo起動
&lt;F12&gt; PasteモードのOn/Off


## 備考

zencodingが生成するタグのインデントは、325行目で調節可能。

自動補完(NeoComplCache)を向こうにする場合は、.vimrc 338行目で

    let g:neocomplcache_enable_at_startup = 0

...とすれば良い。

