set number
set clipboard+=unnamedplus
set runtimepath+=~/.cache/dein.vim

if dein#load_state('~/.cache/dein.vim')
  call dein#begin('~/.cache/dein.vim')
  call dein#load_toml('~/.cache/dein.toml', {'lazy': 0})

  call dein#end()
  call dein#save_state()
endif

" Edit
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set backspace=eol,indent,start,indent
set smartindent
set smarttab
set showmatch
set whichwrap=b,s,h,l,<,>,[,]
set fileencodings=ucs-bom,utf-8,euc-jp,cp932,iso-2022-jp

let mapleader = ','

" :up = (Leader or CR) * 2
" <http://blog.blueblack.net/item_317>
noremap <CR><CR> :up<CR>

" Line Scroll

nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap 0 g0
nnoremap g0 0
nnoremap $ g$
nnoremap g$ $
" Center Scroll
nnoremap n nzz
nnoremap N Nzz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap G Gzz
nnoremap <Space> jzz
nnoremap <S-Space> kzz
vnoremap <Space> jzz
vnoremap <S-Space> kzz
nnoremap Y y$

nnoremap <Esc><Esc> :nohlsearch<Return>

nnoremap sj <C-W>j
nnoremap sk <C-W>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap sn :bnext<CR>
nnoremap sp :bprevious<CR>
nnoremap sq :bdelete<CR>

nnoremap ss <C-W>s
nnoremap sc <C-W>c
nnoremap so <C-W>o
nnoremap sv <C-W>v
nnoremap sN <C-W>n
nnoremap s. <C-W>=
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap ) <C-W>>
nnoremap ( <C-W><LT>

nnoremap s> <C-W>L
nnoremap s< <C-W>H
nnoremap sV <C-W>J
nnoremap s^ <C-W>K

filetype plugin indent on
syntax enable
