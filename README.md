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

(練習用)十字キーの封印<br />
(練習用)&lt;C-c&gt;の封印

<table>
<tr><th>bp</th><td>1つ前のバッファに切替</td></tr>
<tr><th>bn</th><td>1つ次のバッファに切替</td></tr>
<tr><th>bd</th><td>現在のバッファを削除</td></tr>
<tr><th>gc</th><td>直前に編集したテキストを再選択（ヤンクしたテキストなど）</td></tr>

<tr><th></th><td></td></tr>

<tr><th>&lt;Space-r&gt;</th><td>表示中のファイルをリロード(VimScript)</td></tr>
<tr><th>&lt;Space-v&gt;</th><td>.vimrcと.gvimrcをリロード</td></tr>
<tr><th>&lt;Space-,&gt;</th><td>.vimrcに切替</td></tr>
<tr><th>&lt;Space-.&gt;</th><td>.gvimrcに切替</td></tr>

<tr><th></th><td></td></tr>

<tr><th>:CD</th><td>現在ファイルの階層に移動</td></tr>
<tr><th>:Utf8</th><td>utf-8で再読込</td></tr>
<tr><th>:Sjis</th><td>sjisで再読込</td></tr>
<tr><th>:Euc</th><td>euc-jpで再読込</td></tr>

<tr><th></th><td></td></tr>

<tr><th>&lt;Esc&gt;&lt;Esc&gt;</th><td>検索ハイライトを解除</td></tr>
<tr><th>&lt;F3&gt;</th><td>NERDTree起動</td></tr>
<tr><th>&lt;F5&gt;</th><td>Gundo起動</td></tr>
<tr><th>&lt;F12&gt;</th><td>PasteモードのOn/Off</td></tr>
</table>


## 備考

zencodingが生成するタグのインデントは、325行目で調節可能。

自動補完(NeoComplCache)を向こうにする場合は、.vimrc 338行目で

    let g:neocomplcache_enable_at_startup = 0

...とすれば良い。

