source ~/.vimrc.keymap
source ~/.vimrc.set

if filereadable(expand('~/.config/nvim/dein.vim'))
  source ~/.config/nvim/dein.vim
endif

if filereadable(expand('~/.config/nvim/keymap.vim'))
  source ~/.config/nvim/keymap.vim
endif

if filereadable(expand('~/.config/nvim/terminal.vim'))
  source ~/.config/nvim/terminal.vim
endif

if filereadable(expand('~/.config/nvim/color.vim'))
  source ~/.config/nvim/color.vim
endif

if filereadable(expand('~/.config/nvim/ctrlp.vim'))
  source ~/.config/nvim/ctrlp.vim
endif

if filereadable(expand('~/.config/nvim/lightline.vim'))
  source ~/.config/nvim/lightline.vim
endif

if filereadable(expand('~/.config/nvim/deoplete.rc.vim'))
  source ~/.config/nvim/deoplete.rc.vim
endif

" クリップボード
set clipboard+=unnamedplus

"title を表示
set title
"ルーラーを表示
set ruler
"行番号を表示
set number
"タブの代わりに半角スペース
set expandtab

" 横線
" set cursorline
" 縦線
" set cursorcolumn

" swp ファイルなし
set nobackup
set noswapfile

"java の場合 タブ4文字分
if expand("%:t") =~ ".*\.java"
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
elseif expand("%:t") =~ ".*\.go"
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
  set softtabstop=2
else
  "タブ2文字分
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
endif

"encoding = utf
set encoding=utf-8
scriptencoding utf-8
" 保存する時の文字コード
set fileencoding=utf-8
" 開く時の文字コード
set fileencodings=utf-8,cp932,euc-jp
" 端末の文字コード
set termencoding=utf-8
"backspace で改行、インデント、以前入力した文字を削除できるようにする
set backspace=indent,eol,start

" 文頭や文末で左右に動いたら次の行や前の行にいけるようにする
set whichwrap=b,s,h,l,<,>,[,]

" タブ文字とか半角とか色々を可視化
set list
set lcs=tab:>.,trail:_,extends:\

set autoread   " 外部でファイルに変更がされた場合は読みなおす

set modeline
let g:tex_flavor = "latex"

augroup vimrc-checktime "window移動/一定時間カーソルが停止した場合に強制的に読みなおす
  autocmd!
  set updatetime=400
  autocmd WinEnter * checktime
  autocmd CursorHold * checktime
augroup END

set clipboard+=unnamed

"折りたたみ
set foldmethod=indent
set foldlevel=2

" set tags=.tags

set scrolloff=12

set mouse=a

set incsearch
set nohlsearch

set autoindent
set wildmenu

" () {} などの補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead Guardfile  set filetype=ruby
autocmd BufNewFile,BufRead .pryrc     set filetype=ruby

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
" カーソル形状変化
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" 日本語ヘルプを利用する
set helplang=ja,en

set ttimeout
set ttimeoutlen=50
