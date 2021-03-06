set nocompatible

call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

" -----------------------------------------------------------------------
" Basis:{{{
"

" display
set number
set ruler
set cmdheight=1
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set title
set linespace=0
set showcmd
set wildmenu
set wildmode=list:longest,full

" syntax color
syntax on

colorscheme ir_black
set cursorline
highlight FoldColumn ctermbg=8 guibg=grey5
highlight CursorLine term=underline ctermbg=0 gui=underline guisp=#555566

" search
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch
set grepprg=grep\ -nH

" edit
set autoindent
set cindent
set showmatch
set backspace=indent,eol,start
set clipboard=unnamed
set pastetoggle=<F12>
set guioptions+=a
command! -nargs=1 -bang -bar -complete=file Rename sav<bang> <args> | call delete(expand('#:p'))

" tab
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set shiftround
set nowrap

set listchars=tab:>-
set list

" Enable folding.
set foldenable
set foldmethod=marker
set foldcolumn=5

" diff
set diffopt=filler,vertical

" window
set splitbelow
set splitright
set visualbell

"}}}


" -----------------------------------------------------------------------
" QuickStart: {{{
"  - gundo.vim    (https://github.com/sjl/gundo.vim)
"  - jslint.vim   (https://github.com/basyura/jslint.vim)
"  - NERD_tree.vim(https://github.com/scrooloose/nerdtree)
"
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :JSLint<CR> 
nnoremap <F5> :GundoToggle<CR>
"}}}


" -----------------------------------------------------------------------
" Keymap:{{{
" --------------------

" practice
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>

" practice <Esc>
noremap <C-c> <Nop>
inoremap <C-c> <Nop>
inoremap jj <Esc>

" move
nnoremap zl zL
nnoremap zh zH
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap gh gT
noremap gl gt

" text-edit
noremap <CR> i<CR><ESC>

" brackets"
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>
inoremap []5 [%  %]<LEFT><LEFT><LEFT>
inoremap {}5 {%  %}<LEFT><LEFT><LEFT>

" search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'

" fix window-size
nnoremap <silent> <S-Left>  :5wincmd <<CR>
nnoremap <silent> <S-Right> :5wincmd ><CR>
nnoremap <silent> <S-Up>    :5wincmd -<CR>
nnoremap <silent> <S-Down>  :5wincmd +<CR>

" buffer
nnoremap bb :b#<CR>
nnoremap bp :bprevious<CR>
nnoremap bn :bnext<CR>
nnoremap bd :bdelete<CR>

" re-select 'last edited text'
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<CR>
onoremap gc :<C-u>normal gc<CR>

" vim(rc)
nnoremap <Space>r :<C-u>execute "source " expand("%:p")<CR>
nnoremap <Space>v :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <Space>, :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>. :<C-u>edit $MYGVIMRC<CR>

" Encode
command! -bang -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>
command! -bang -nargs=? Sjis edit<bang> ++enc=sjis <args>
command! -bang -nargs=? Euc edit<bang> ++enc=euc-jp <args>

" Other Hacks
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
cnoremap <C-p> <Up> 
cnoremap <C-n> <Down> 
cnoremap <Leader><Leader> ~/
nnoremap ; :
nnoremap : ;
"}}}


" -----------------------------------------------------------------------
" augroups: {{{
" 

" For noexpandtab
augroup MyAutoCmd
    " reset autocmd-list
    autocmd!
    
    " If open new-buffer, set expandtab
    autocmd BufNewFile,BufRead * set expandtab

    " go to file!
    autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

    " Custom folding
    autocmd BufEnter * if &filetype == "javascript" | set foldmarker={,} | set foldlevel=3 | set foldcolumn=7 | endif
    
    " for Sass.vim
    autocmd BufRead,BufNewFile *.sass setfiletype sass 
augroup END

"}}}


" -----------------------------------------------------------------------
" encoding: {{{
"  - http://www.kawaz.jp/pukiwiki/?vim
"

if !has('gui_macvim') && !has('kaoriya')
    set encoding=utf8
    set fileencodings=iso-2022-jp,sjis,utf8

    if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'eucjp-ms'
        let s:enc_jis = 'iso-2022-jp-3'
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        let &fileencodings = &fileencodings .','. s:fileencodings_default
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
        set fileencodings+=cp932
        set fileencodings-=euc-jp
        set fileencodings-=euc-jisx0213
        set fileencodings-=eucjp-ms
        let &encoding = s:enc_euc
        let &fileencoding = s:enc_euc
        else
        let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    unlet s:enc_euc
    unlet s:enc_jis
    endif

    if has('autocmd')
    function! AU_ReCheck_FENC()
        if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
        let &fileencoding=&encoding
        endif
    endfunction
    autocmd BufReadPost * call AU_ReCheck_FENC()
    endif

    set fileformats=unix,dos,mac
    if exists('&ambiwidth')
    set ambiwidth=double
    endif
endif
"}}}


" -----------------------------------------------------------------------
" HTML Key Mappings for Typing Character Codes: {{{
" 
" |--------------------------------------------------------------------
" |Keys     |Insert   |For  |Comment
" |---------|---------|-----|-------------------------------------------
" |\&       |&amp;    |&    |ampersand
" |\<       |&lt;     |<    |less-than sign
" |\>       |&gt;     |>    |greater-than sign
" |\.       |&middot; |・   |middle dot (decimal point)
" |\?       |&#8212;  |?    |em-dash
" |\2       |&#8220;  |“    |open curved double quote
" |\"       |&#8221;  |”    |close curved double quote
" |\`       |&#8216;  |‘    |open curved single quote
" |\'       |&#8217;  |’    |close curved single quote (apostrophe)
" |\`       |`        |`    |OS-dependent open single quote
" |\'       |'        |'    |OS-dependent close or vertical single quote
" |\<Space> |&nbsp;   |     |non-breaking space
" |---------------------------------------------------------------------
"
" > http://www.stripey.com/vim/html.html
"
"
autocmd BufEnter * if &filetype == "html" | call MapHTMLKeys() | endif
function! MapHTMLKeys(...)
  if a:0 == 0 || a:1 != 0
    inoremap \\ \
    inoremap \& &amp;
    inoremap \< &lt;
    inoremap \> &gt;
    inoremap \. ・
    inoremap \- &#8212;
    inoremap \<Space> &nbsp;
    inoremap \` &#8216;
    inoremap \' &#8217;
    inoremap \2 &#8220;
    inoremap \" &#8221;
    autocmd! BufLeave * call MapHTMLKeys(0)
  else
    iunmap \\
    iunmap \&
    iunmap \<
    iunmap \>
    iunmap \-
    iunmap \<Space>
    iunmap \`
    iunmap \'
    iunmap \2
    iunmap \"
    autocmd! BufLeave *
  endif " test for mapping/unmapping
endfunction " MapHTMLKeys()
"}}}


" -----------------------------------------------------------------------
" snipMate.vim: {{{
"  - http://www.vim.org/scripts/script.php?script_id=2540
"
" below, Reload xxx.snippet. :call SnipMateReload()
"  -> http://webtech-walker.com/archive/2009/10/26021358.html
"
function! SnipMateReload()
    if &ft == 'snippet'
        let ft = substitute(expand('%'), '.snippets', '', '')
        if has_key(g:did_ft, ft)
            unlet g:did_ft[ft]
        endif
        silent! call GetSnippets(g:snippets_dir, ft)
    endif
endfunction
"}}}


" -----------------------------------------------------------------------
" zencoding.vim: {{{
let g:user_zen_settings = {
\  'html' : {
\    'indentation' : '    '
\  },
\}

"}}}


" -----------------------------------------------------------------------
" neocomplcache: {{{
"  - https://github.com/Shougo/neocomplcache
"  - https://github.com/Shougo/neocomplcache/blob/998764e1072fa5b183c3da4705b8187658fa0b41/presen/neocomplcache.txt
"
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3

"Quick Type, ignore neocomplcache.
let g:NeoComplCache_SkipCompletionTime = '0.3'
let g:NeoComplCache_SkipInputTime = '0.1'

" Plugin key-mappings.
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" <CR> : delete popup and hold indent
" <BS> : close popup and delete backword char.
" <C-h>: close popup and delete backword char.
" <C-n>: manual-start neocomplcache.
" <C-p>: Vim native-keyword complement.
" <C-j>: Vim native-Omni completion.
inoremap <expr><CR> pumvisible() ? "\<C-y>\<CR>X\<BS>" : "\<CR>X\<BS>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
inoremap <expr><C-j> &filetype == 'vim' ? "\<C-x>\<C-v>\<C-p>" : "\<C-x>\<C-o>\<C-p>"

"}}}


" -----------------------------------------------------------------------
" jslint.vim: {{{
"  - https://github.com/basyura/jslint.vim
"  - :copen -> :cnext ...
augroup jslint
    autocmd! jslint
    autocmd FileType javascript call s:javascript_filetype_settings()
augroup END

function! s:javascript_filetype_settings()
  autocmd BufLeave     <buffer> call jslint#clear()
  autocmd BufWritePost <buffer> call jslint#check()
  autocmd CursorMoved  <buffer> call jslint#message()
endfunction

"}}}


" -----------------------------------------------------------------------
" html5.vim: {{{
"  - https://github.com/othree/html5.vim
let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_aria_attributes_complete = 1
"}}}


" -----------------------------------------------------------------------
" QuickBuf: {{{
"  - https://github.com/vim-scripts/QuickBuf
let g:qb_hotkey = "<F2>"
"}}}


" -----------------------------------------------------------------------
" Like :CdCurrent {{{
"  - http://vim-users.jp/2009/09/hack69/
"  - :CD
"
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction
"}}}


