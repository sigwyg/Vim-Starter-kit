Vim Starter-Kit
===================================

    .vimrc
    .vim
    ├── autoload
    │   └── pathogen.vim
    ├── bundle
    │   ├── gundo.vim
    │   ├── html5.vim
    │   ├── jslint.vim
    │   ├── neocomplcache
    │   ├── nerdtree
    │   ├── snipmate.vim
    │   ├── vim-alignta
    │   ├── vim-css3-syntax
    │   ├── vim-fontzoom
    │   ├── vim-qfreplace
    │   ├── vim-surround
    │   ├── scss-syntax.vim
    │   └── zencoding-vim
    ├── colors
    │   └── ir_black.vim
    ├── ftplugin
    │   └── html.vim
    └── plugin
        └─ endtagcomment.vim

1. Macならホームディレクトリ(~/)に。
   WinならGVimフォルダ内のvimfilesにコピったり、\_vimrcとして設置してください。
2. プラグインを追加するときはbundleフォルダに新規フォルダを追加して、その中に入れてください。

※プラグインはPathogenで管理しています。


## キーマップ(Normal mode)

(練習用)十字キーの封印<br />
(練習用)&lt;C-c&gt;の封印

<table>
<tr><th>&lt;F3&gt;</th><td>NERDTree展開/格納</td></tr>
<tr><th>&lt;F4&gt;</th><td>JSLint手動チェック</td></tr>
<tr><th>&lt;F5&gt;</th><td>Gundo展開/格納</td></tr>
<tr><th>&lt;F12&gt;</th><td>PasteモードのOn/Off</td></tr>
<tr><th>&lt;Esc&gt;&lt;Esc&gt;</th><td>検索ハイライトを解除</td></tr>

<tr><th>bp</th><td>1つ前のバッファに切替</td></tr>
<tr><th>bn</th><td>1つ次のバッファに切替</td></tr>
<tr><th>bd</th><td>現在のバッファを削除</td></tr>
<tr><th>gc</th><td>直前に編集したテキストを再選択（ヤンクしたテキストなど）</td></tr>

<tr><th>&nbsp;</th><td>&nbsp;</td></tr>

<tr><th>&lt;Space-r&gt;</th><td>表示中のファイルをリロード(VimScript)</td></tr>
<tr><th>&lt;Space-v&gt;</th><td>.vimrcと.gvimrcをリロード</td></tr>
<tr><th>&lt;Space-,&gt;</th><td>.vimrcに切替</td></tr>
<tr><th>&lt;Space-.&gt;</th><td>.gvimrcに切替</td></tr>

<tr><th>&nbsp;</th><td>&nbsp;</td></tr>

<tr><th>:CD</th><td>現在ファイルの階層に移動</td></tr>
<tr><th>:Utf8</th><td>utf-8で再読込</td></tr>
<tr><th>:Sjis</th><td>sjisで再読込</td></tr>
<tr><th>:Euc</th><td>euc-jpで再読込</td></tr>

<tr><th>&nbsp;</th><td>&nbsp;</td></tr>
</table>


## キーマップ(insert-mode)

<table>
<tr><th>&lt;C-p&gt;</th><td>Vimのキーワード補完を手動起動</td></tr>
<tr><th>&lt;C-j&gt;</th><td>Vimのオムニ補完を手動起動</td></tr>
<tr><th>&lt;C-n&gt;</th><td>NeoComPlcacheの手動起動</td></tr>
<tr><th>&lt;C-h&gt;/&lt;BS&gt;</th><td>オムニ補完のポップアップを消す</td></tr>
</table>

※1: 補完ポップアップでの上下移動は &lt;C-n&gt;が↓、&lt;C-p&gt;が↑<br />
※2: html5.vimのオムニ補完はVimネイティブのオムニ補完を使っているので、&lt;C-j&gt;から起動する。


## 備考

zencodingが生成するタグのインデントは、以下の部分で調節可能(引用符の中にインデント)。

    let g:user_zen_settings = {
    \  'html' : {
    \    'indentation' : '    '
    \  },
    \}

自動補完(NeoComplCache)を無効にする場合は、.vimrc 338行目で

    let g:neocomplcache_enable_at_startup = 0

...とすれば良い。

JSLintの解析結果はQuickfixに追加されるので、:copenや:cnで確認できる。

## Tips

Vimが自動生成するバックアップ・ファイル等は通常はindex.html~ のように

    hoge_dir
    ├─index.html 
    └─index.html~

...のように編集ファイルと同じディレクトリに保存される。
以下のように.vimrcに記述すると、指定ディレクトリにバックアップ・ファイルを纏めることができる。

    " backup
    set backup
    set swapfile
    set backupdir=~/.vim/backup
    set directory=~/.vim/swap

また、Vimの優秀なUndoツリーを視覚化するGundo.vimと、以下の設定は相性が良い。

    if has('persistent_undo')
        set undofile
        set undodir=./.vimundo,~/.vim/undo
    endif

この設定はUndo履歴をファイルに書き出すことで、永続的なUndoを可能とする。
つまり、通常はバッファ削除時に破棄されるUndo履歴を保持する。詳細は:h undo-persistenceにて。
