
"----------------------------------------
" :source ~/.vimrcで読み込み
"----------------------------------------

"----------------------------------------
" nnoremapでコマンドをキーバインド変更
"----------------------------------------

" 大文字O(オー)でinsert modeにならず空白行を下に追加。
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 括弧
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

" ペストモード
nnoremap pt :set paste<CR>
nnoremap np :set nopaste<CR>

"----------------------------------------
" 汎用
"----------------------------------------

"文字コードをUFT-8に設定
set fenc=utf-8

" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block

" 全角文字専用の設定
set ambiwidth=double

" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

" macのクリップボードにコピペ
set clipboard=unnamed

" 文字コードを正しく認識して、動作不良を起こさない
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

"----------------------------------------
" 作成しないファイル
"----------------------------------------

" バックアップファイルを作らない
set nobackup

" スワップファイルを作らない
set noswapfile

" 編集中のファイルが変更されたら自動で読み直す
set autoread

" バッファが編集中でもその他のファイルを開けるように
set hidden

" 入力中のコマンドをステータスに表示する
set showcmd

"----------------------------------------
" 検索
"----------------------------------------

" 検索するときに大文字小文字を区別しない
set ignorecase

" 小文字で検索すると大文字と小文字を無視して検索
set smartcase

" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan

" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch

" 検索結果をハイライト表示
" ESC連打でハイライト解除 13行目に記述
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------

" 行数の表示
set ruler

" 現在の行を強調表示
set cursorline

" 現在の行を強調表示（縦）
set cursorcolumn

" 対応する括弧やブレースを表示
set cinoptions+=:0

" メッセージ表示欄を2行確保
set cmdheight=2

" ステータス行を常に表示
set laststatus=2

" tabでコマンドライン補完
set wildmenu

" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd

" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list

" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~

" コマンドラインの履歴を10000件保存する
set history=10000

" コメントの色を水色
hi Comment ctermfg=3

" 対応する括弧を強調表示
set showmatch

" タイトルを表示
set title

" 行番号の表示
set number

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 構文毎に文字色を変化させる
syntax on

" カラースキーマの指定
colorscheme desert

" 行番号の色
highlight LineNr ctermfg=darkyellow

"----------------------------------------
" インデント, Tab系
"----------------------------------------

" 自動インデント
set autoindent

" インデントはスマートインデント
set smartindent

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-

" Tab文字を半角スペースにする
set expandtab

" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2

" 行頭でのTab文字の表示幅
set shiftwidth=2

" コピペの行制御
" 常時pasteモードにする
set paste

" Turn off paste mode when leaving insert
" https://archive.craftz.dog/blog.odoruinu.net/2014/01/29/how-to-turn-off-paste-mode-when-becoming-normal-mode-on-vim/index.html
autocmd InsertLeave * set nopaste

"----------------------------------------
" vim-plug :
" :PlugInstallを忘れずに
" :PlugUpdate
" :PlugClean
"----------------------------------------

call plug#begin('~/.vim/plugged')

" ファイルオープンを便利に
"Plug 'Shougo/unite.vim'

" Unite.vimで最近使ったファイルを表示できるようにする
"Plug 'Shougo/neomru.vim'

" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree'

" Rails向けのコマンドを提供する
Plug 'tpope/vim-rails'

" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
"Shift+Vで対象の範囲を選択
"Ctrl+-(コントロールキー+ハイフン)を2回押すだけで、その範囲をまとめてコメントアウト
Plug 'tomtom/tcomment_vim'

" シングルクオートとダブルクオートの入れ替え等
" cs'" シングルクオートをダブルクオートに置換
Plug 'tpope/vim-surround'

" ダブルコーテーション→シングルコーテーション
nmap ff <Plug>Csurround"'

" " シングルコーテーション→ダブルコーテーション
nmap tt <Plug>Csurround'"

" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" 色の差分を1%に抑える
let g:indent_guides_color_change_percent = 1
" インデント部分のどれだけ分を背景色を変えるか指定 1文字に変更
let g:indent_guides_guide_size = 1
" 色を変更
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" 可視化を行う階層を指定
let g:indent_guides_start_level = 2
" 無効にするファイル郡を指定
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']


"Plug 'Yggdroot/indentLine'

" ログファイルを色づけしてくれる
Plug 'vim-scripts/AnsiEsc.vim'

" 行末の半角スペースを可視化
Plug 'bronson/vim-trailing-whitespace'

call plug#end()

"----------------------------------------
" unite.vimの設定
"----------------------------------------

" 入力モードで開始する
"let g:unite_enable_start_insert=1
" " バッファ一覧
"noremap <C-P> :Unite buffer<CR>
" " ファイル一覧
"noremap <C-N> :Unite -buffer-name=file file<CR>
" " 最近使ったファイルの一覧
"noremap <C-Z> :Unite file_mru<CR>
" " sourcesを「今開いているファイルのディレクトリ」とする
"noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" " ウィンドウを分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-P>  unite#do_action('split')
"au FileType unite inoremap <silent> <buffer> <expr> <C-P>  unite#do_action('split')
" " ウィンドウを縦に分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-L>  unite#do_action('vsplit')
"au FileType unite inoremap <silent> <buffer> <expr> <C-L>  unite#do_action('vsplit')
" " ESCキーを2回押すと終了する
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""
