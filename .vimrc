filetype off
filetype plugin indent off

let s:dot_vim_dir = expand('~/.vim')

let s:plugin_dir = expand('~/.vim/dein')
let s:dein_dir = s:plugin_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir

if !isdirectory(s:dein_dir)
    call mkdir(s:dein_dir, 'p')
    silent execute printf('!git clone %s %s','https://github.com/Shougo/dein.vim', s:dein_dir)
endif

if &compatible
  set nocompatible
endif

call dein#begin(s:plugin_dir)
  call dein#add('Shougo/dein.vim')

  call dein#add('w0ng/vim-hybrid')

  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim',        {'depdens': ['unite.vim']})
  call dein#add('Shougo/neoyank.vim',       {'depdens': ['unite.vim']})
  call dein#add('thinca/vim-unite-history', {'depdens': ['unite.vim']})

  if has('lua')
    call dein#add('Shougo/neocomplete.vim')
  endif

  call dein#add('tyru/caw.vim')

  call dein#add('kana/vim-smartword')
  call dein#add('rhysd/clever-f.vim')
  call dein#add('haya14busa/incsearch.vim')

  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-datetime',  {'depdens': ['kana/vim-textobj-user']})
  call dein#add('kana/vim-textobj-entire',    {'depdens': ['kana/vim-textobj-user']})
  call dein#add('kana/vim-textobj-indent',    {'depdens': ['kana/vim-textobj-user']})
  call dein#add('kana/vim-textobj-line',      {'depdens': ['kana/vim-textobj-user']})
  call dein#add('thinca/vim-textobj-between', {'depdens': ['kana/vim-textobj-user']})
  call dein#add('thinca/vim-textobj-comment', {'depdens': ['kana/vim-textobj-user']})
  call dein#add('rhysd/vim-textobj-anyblock', {'depdens': ['kana/vim-textobj-user']})
  call dein#add('osyo-manga/vim-textobj-multiblock', {'depdens': ['kana/vim-textobj-user']})

  call dein#add('kana/vim-operator-user')
  call dein#add('kana/vim-operator-replace',      {'depdens': ['kana/vim-operator-user']})
  call dein#add('rhysd/vim-operator-surround',    {'depdens': ['kana/vim-operator-user']})
  call dein#add('emonkak/vim-operator-sort',      {'depdens': ['kana/vim-operator-user']})
  call dein#add('haya14busa/vim-operator-flashy', {'depdens': ['kana/vim-operator-user']})

  call dein#add('tyru/restart.vim')
  call dein#add('tpope/vim-repeat')

  call dein#add('Yggdroot/indentLine')
  call dein#add('itchyny/lightline.vim')
call dein#end()


augroup MyAutoCmd
  autocmd!
augroup END

" File
set autochdir
set autoread
set clipboard=unnamed
set nobackup
set noswapfile
set wildmenu
if has('win32')
  set shellslash
endif
if has('persistent_undo')
  set undofile
  let &undodir = s:dot_vim_dir . '/.undo' " TODO: path, mkdir
endif
set visualbell

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


" Input
if has('multi_byte_ime')
  " Settings of default ime condition.
  set iminsert=0 imsearch=0
  " Don't save ime condition.
  autocmd MyAutoCmd InsertLeave * set iminsert=0 imsearch=0
  nnoremap / :<C-u>set imsearch=0<CR>/
  xnoremap / :<C-u>set imsearch=0<CR>/
  nnoremap ? :<C-u>set imsearch=0<CR>?
  xnoremap ? :<C-u>set imsearch=0<CR>?
endif


" View
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
set number
set showcmd
set showmatch
set virtualedit+=block
set laststatus=2

" Search
set ignorecase
set smartcase
set wrapscan


" Help
set helplang=ja,en


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

" nohlsearch
nnoremap <Esc><Esc> :nohlsearch<Return>
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

" Search Input Escape
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

" * is search
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
" s* is substitute from cword
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" Yank to end of line
nnoremap Y y$

" Window Operations
nnoremap sj <C-W>j
nnoremap sk <C-W>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap sn :bnext<CR>
nnoremap sp :bprevious<CR>

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

function! s:modulo(n, m)
  let d = a:n * a:m < 0 ? 1 : 0
  return a:n + (-(a:n + (0 < a:m ? d : -d)) / a:m + d) * a:m
endfunction
function! s:swap_window(n)
  let curbuf = bufnr('%')
  let target = s:modulo(winnr() + a:n - 1, winnr('$')) + 1
  execute 'hide' winbufnr(target) . 'buffer'
  execute target 'wincmd w'
  execute curbuf 'buffer'
endfunction
function! s:swap_window_dir(n, dir)
  let curbuf = bufnr('%')
  execute a:n 'wincmd ' . a:dir
  let target = winnr()
  let targetbuf = bufnr('%')
  if curbuf != targetbuf
    wincmd p
    execute 'hide' targetbuf . 'buffer'
    execute target 'wincmd w'
    execute curbuf 'buffer'
  endif
endfunction
nnoremap <silent> <Plug>swap_window_next :<C-u>call <SID>swap_window(v:count1)<CR>
nnoremap <silent> <Plug>swap_window_prev :<C-u>call <SID>swap_window(-v:count1)<CR>
nnoremap <silent> <Plug>swap_window_j :<C-u>call <SID>swap_window_dir(v:count1, 'j')<CR>
nnoremap <silent> <Plug>swap_window_k :<C-u>call <SID>swap_window_dir(v:count1, 'k')<CR>
nnoremap <silent> <Plug>swap_window_h :<C-u>call <SID>swap_window_dir(v:count1, 'h')<CR>
nnoremap <silent> <Plug>swap_window_l :<C-u>call <SID>swap_window_dir(v:count1, 'l')<CR>
nnoremap <silent> <Plug>swap_window_t :<C-u>call <SID>swap_window_dir(v:count1, 't')<CR>
nnoremap <silent> <Plug>swap_window_b :<C-u>call <SID>swap_window_dir(v:count1, 'b')<CR>
nmap sJ <Plug>swap_window_j
nmap sK <Plug>swap_window_k
nmap sH <Plug>swap_window_h
nmap sL <Plug>swap_window_l


" autocmd MyAutoCmd CmdwinEnter * call s:init_cmdwin()
" function! s:init_cmdwin()
"   nnoremap <buffer> q :<C-u>quit<CR>
"   nnoremap <buffer><C-[> :<C-u>quit<CR>
"   nnoremap <buffer><TAB> :<C-u>quit<CR>
"   nnoremap <buffer> ; :
"   xnoremap <buffer> ; :
"   inoremap <buffer><expr><CR> neocomplete#close_popup()."\<CR>"
"   inoremap <buffer><expr><C-h> col('.') == 1 ? "\<ESC>:quit\<CR>" : neocomplete#cancel_popup()."\<C-h>"
"   inoremap <buffer><expr><BS> col('.') == 1 ? "\<ESC>:quit\<CR>" : neocomplete#cancel_popup()."\<C-h>"
"   inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>\<C-p>"
"   startinsert!
" endfunction
" nnoremap <sid>(command-line-enter) q:
" xnoremap <sid>(command-line-enter) q:
" nnoremap <sid>(command-line-norange) q:<C-u>
" nmap : <sid>(command-line-enter)
" xmap : <sid>(command-line-enter)


" Reverse
" <http://vim.wikia.com/wiki/Reverse_all_lines>
command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1|nohl

" Stab
" Set tabstop, softtabstop and shiftwidth to the same value
" <http://vimcasts.org/episodes/tabs-and-spaces/>
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction


" RTrim
function! RTrim()
  let s:cursor = getpos(".")
  %s/\s\+$//e
  call setpos(".", s:cursor)
endfunction
autocmd MyAutoCmd BufWritePre * call RTrim()

" Cursorline
" <http://d.hatena.ne.jp/thinca/20090530/1243615055>
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd WinLeave * call s:auto_cursorline('WinLeave')
  let s:cursorline_lock = 0
  function! s:auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      let s:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
    elseif a:event ==# 'CursorMoved'
      if s:cursorline_lock
        if 1 < s:cursorline_lock
          let s:cursorline_lock = 1
        else
          setlocal nocursorline
          let s:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      setlocal cursorline
      let s:cursorline_lock = 1
    endif
  endfunction
augroup END


augroup PluginInstall
    autocmd!
    autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

augroup ThemeInstall
    autocmd!
    autocmd VimEnter * nested set background=dark
    autocmd VimEnter * nested colorscheme hybrid
augroup END


if dein#tap('clever-f.vim')
  " <http://rhysd.hatenablog.com/entry/2013/09/17/220837>
  let g:clever_f_smart_case = 1
  let g:clever_f_use_migemo = 1
  let g:clever_f_chars_match_any_signs = ';'
endif

if dein#tap('neocomplete.vim')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#enable_auto_select = 1
  let g:neocomplete#enable_cursor_hold_i = 1

  let g:neocomplete#data_directory = s:dot_vim_dir . '/.neocon'

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    " return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup() . "\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup() . "\<C-h>"
  inoremap <expr><C-y> neocomplete#close_popup()
  inoremap <expr><C-e> neocomplete#cancel_popup()
  inoremap <expr><C-o> neocomplete#complete_common_string()

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif

if dein#tap('skk.vim')
  let g:skk_jisyo = s:dot_vim_dir . '/.skk-jisyo'
  let g:skk_large_jisyo = s:dot_vim_dir . '/SKK-JISYO+hatena.dic'
  let g:skk_auto_save_jisyo = 1
  let g:skk_keep_state = 1
  let g:skk_use_color_cursor = 1
  let g:skk_sticky_key = ';'
  let g:skk_kakutei_key = '.'
  let g:skk_cursor_hira_color   = '#0000ff'
  let g:skk_cursor_kata_color   = '#ff0000'
  let g:skk_cursor_zenei_color  = '#ffcc00'
  let g:skk_cursor_ascii_color  = '#00ff00'
  let g:skk_cursor_abbrev_color = '#00ccff'
  let g:skk_egg_like_newline = 1
  let g:skk_use_face = 1

  " azik
  let skk_henkan_point_keys = 'ABCDEFGHIJKMNOPQRSTUVWXYZ+'
  let skk_user_rom_kana_rules = ""
        \. "(	�i\<NL>"
        \. ")	�j\<NL>"
        \. ":	��	�b	\<NL>"
        \. "q	��	��\<NL>"
        \. "z:	�F\<NL>"
        \. "z;	�G\<NL>"
        \. "z-	�[\<NL>"
        \. "*	�[\<NL>"
        \. "~	�`\<NL>"
        \. "tt	��	�b	t\<NL>"
  let skk_rom_kana_rules = ""
        \. ";	��	�b\<NL>"
        \. "a	��	�A\<NL>"
        \. "ba	��	�o\<NL>"
        \. "bd	�ׂ�	�x��\<NL>"
        \. "be	��	�x\<NL>"
        \. "bh	�Ԃ�	�u�E\<NL>"
        \. "bi	��	�r\<NL>"
        \. "bj	�Ԃ�	�u��\<NL>"
        \. "bk	�т�	�r��\<NL>"
        \. "bl	�ڂ�	�{��\<NL>"
        \. "bn	�΂�	�o��\<NL>"
        \. "bo	��	�{\<NL>"
        \. "bp	�ڂ�	�{�E\<NL>"
        \. "bq	�΂�	�o�C\<NL>"
        \. "br	�΂�	�o��\<NL>"
        \. "bt	�т�	�r�g\<NL>"
        \. "bu	��	�u\<NL>"
        \. "bw	�ׂ�	�x�C\<NL>"
        \. "bx	�ׂ�	�x�C\<NL>"
        \. "bya	�т�	�r��\<NL>"
        \. "byd	�т���	�r�F��\<NL>"
        \. "bye	�т�	�r�F\<NL>"
        \. "byh	�тイ	�r���E\<NL>"
        \. "byi	�т�	�r�B\<NL>"
        \. "byj	�т��	�r����\<NL>"
        \. "byl	�т��	�r����\<NL>"
        \. "byn	�т��	�r����\<NL>"
        \. "byo	�т�	�r��\<NL>"
        \. "byp	�т傤	�r���E\<NL>"
        \. "byq	�тႢ	�r���C\<NL>"
        \. "byu	�т�	�r��\<NL>"
        \. "byw	�т���	�r�F�C\<NL>"
        \. "byz	�т��	�r����\<NL>"
        \. "bz	�΂�	�o��\<NL>"
        \. "ca	����	�`��\<NL>"
        \. "cc	����	�`��\<NL>"
        \. "cd	������	�`�F��\<NL>"
        \. "ce	����	�`�F\<NL>"
        \. "cf	����	�`�F\<NL>"
        \. "ch	���イ	�`���E\<NL>"
        \. "ci	��	�`\<NL>"
        \. "cj	�����	�`����\<NL>"
        \. "ck	����	�`��\<NL>"
        \. "cl	�����	�`����\<NL>"
        \. "cn	�����	�`����\<NL>"
        \. "co	����	�`��\<NL>"
        \. "cp	���傤	�`���E\<NL>"
        \. "cq	���Ⴂ	�`���C\<NL>"
        \. "cu	����	�`��\<NL>"
        \. "cv	���Ⴂ	�`���C\<NL>"
        \. "cw	������	�`�F�C\<NL>"
        \. "cx	������	�`�F�C\<NL>"
        \. "cya	����	�`��\<NL>"
        \. "cye	����	�`�F\<NL>"
        \. "cyi	����	�`�B\<NL>"
        \. "cyo	����	�`��\<NL>"
        \. "cyu	����	�`��\<NL>"
        \. "cz	�����	�`����\<NL>"
        \. "da	��	�_\<NL>"
        \. "dch	�ł�	�f���[\<NL>"
        \. "dci	�ł�	�f�B\<NL>"
        \. "dck	�ł���	�f�B��\<NL>"
        \. "dcp	�ǂ�	�h�D�[\<NL>"
        \. "dcu	�ł�	�f��\<NL>"
        \. "dd	�ł�	�f��\<NL>"
        \. "de	��	�f\<NL>"
        \. "df	��	�f\<NL>"
        \. "dg	����	�_�K\<NL>"
        \. "dh	�Â�	�d�E\<NL>"
        \. "dha	�ł�	�f��\<NL>"
        \. "dhe	�ł�	�f�F\<NL>"
        \. "dhi	�ł�	�f�B\<NL>"
        \. "dho	�ł�	�f��\<NL>"
        \. "dhu	�ł�	�f��\<NL>"
        \. "di	��	�a\<NL>"
        \. "dj	�Â�	�d��\<NL>"
        \. "dk	����	�a��\<NL>"
        \. "dl	�ǂ�	�h��\<NL>"
        \. "dm	�ł�	�f��\<NL>"
        \. "dn	����	�_��\<NL>"
        \. "do	��	�h\<NL>"
        \. "dp	�ǂ�	�h�E\<NL>"
        \. "dq	����	�_�C\<NL>"
        \. "dr	�ł���	�f�A��\<NL>"
        \. "ds	�ł�	�f�X\<NL>"
        \. "dt	����	�_�`\<NL>"
        \. "du	��	�d\<NL>"
        \. "dv	�ł�	�f��\<NL>"
        \. "dw	�ł�	�f�C\<NL>"
        \. "dy	�ł�	�f�B\<NL>"
        \. "dya	����	�a��\<NL>"
        \. "dye	����	�a�F\<NL>"
        \. "dyi	����	�a�B\<NL>"
        \. "dyo	����	�a��\<NL>"
        \. "dyu	����	�a��\<NL>"
        \. "dz	����	�_��\<NL>"
        \. "e	��	�G\<NL>"
        \. "fa	�ӂ�	�t�@\<NL>"
        \. "fd	�ӂ���	�t�F��\<NL>"
        \. "fe	�ӂ�	�t�F\<NL>"
        \. "fh	�ӂ�	�t�E\<NL>"
        \. "fi	�ӂ�	�t�B\<NL>"
        \. "fj	�ӂ�	�t��\<NL>"
        \. "fk	�ӂ���	�t�B��\<NL>"
        \. "fl	�ӂ���	�t�H��\<NL>"
        \. "fm	�ӂ�	�t��\<NL>"
        \. "fn	�ӂ���	�t�@��\<NL>"
        \. "fo	�ӂ�	�t�H\<NL>"
        \. "fp	�ӂ�	�t�H�[\<NL>"
        \. "fq	�ӂ���	�t�@�C\<NL>"
        \. "fr	�ӂ�	�t��\<NL>"
        \. "fs	�ӂ���	�t�@�C\<NL>"
        \. "fu	��	�t\<NL>"
        \. "fw	�ӂ���	�t�F�C\<NL>"
        \. "fya	�ӂ�	�t��\<NL>"
        \. "fye	�ӂ�	�t�F\<NL>"
        \. "fyi	�ӂ�	�t�B\<NL>"
        \. "fyo	�ӂ�	�t��\<NL>"
        \. "fyu	�ӂ�	�t��\<NL>"
        \. "fz	�ӂ���	�t�@��\<NL>"
        \. "ga	��	�K\<NL>"
        \. "gd	����	�Q��\<NL>"
        \. "ge	��	�Q\<NL>"
        \. "gh	����	�O�E\<NL>"
        \. "gi	��	�M\<NL>"
        \. "gj	����	�O��\<NL>"
        \. "gk	����	�M��\<NL>"
        \. "gl	����	�S��\<NL>"
        \. "gn	����	�K��\<NL>"
        \. "go	��	�S\<NL>"
        \. "gp	����	�S�E\<NL>"
        \. "gq	����	�K�C\<NL>"
        \. "gr	����	�K��\<NL>"
        \. "gt	����	�S�g\<NL>"
        \. "gu	��	�O\<NL>"
        \. "gw	����	�Q�C\<NL>"
        \. "gya	����	�M��\<NL>"
        \. "gyd	������	�M�F��\<NL>"
        \. "gye	����	�M�F\<NL>"
        \. "gyh	���イ	�M���E\<NL>"
        \. "gyi	����	�M�B\<NL>"
        \. "gyj	�����	�M����\<NL>"
        \. "gyl	�����	�M����\<NL>"
        \. "gyn	�����	�M����\<NL>"
        \. "gyo	����	�M��\<NL>"
        \. "gyp	���傤	�M���E\<NL>"
        \. "gyq	���Ⴂ	�M���C\<NL>"
        \. "gyu	����	�M��\<NL>"
        \. "gyw	������	�M�F�C\<NL>"
        \. "gyz	�����	�M����\<NL>"
        \. "gz	����	�K��\<NL>"
        \. "ha	��	�n\<NL>"
        \. "hd	�ւ�	�w��\<NL>"
        \. "he	��	�w\<NL>"
        \. "hf	��	�t\<NL>"
        \. "hga	�Ђ�	�q��\<NL>"
        \. "hgd	�Ђ���	�q�F��\<NL>"
        \. "hge	�Ђ�	�q�F\<NL>"
        \. "hgh	�Ђイ	�q���E\<NL>"
        \. "hgj	�Ђ��	�q����\<NL>"
        \. "hgl	�Ђ��	�q����\<NL>"
        \. "hgn	�Ђ��	�q����\<NL>"
        \. "hgo	�Ђ�	�q��\<NL>"
        \. "hgp	�Ђ傤	�q���E\<NL>"
        \. "hgq	�ЂႢ	�q���C\<NL>"
        \. "hgu	�Ђ�	�q��\<NL>"
        \. "hgw	�Ђ���	�q�F�C\<NL>"
        \. "hgz	�Ђ��	�q����\<NL>"
        \. "hh	�ӂ�	�t�E\<NL>"
        \. "hi	��	�q\<NL>"
        \. "hj	�ӂ�	�t��\<NL>"
        \. "hk	�Ђ�	�q��\<NL>"
        \. "hl	�ق�	�z��\<NL>"
        \. "hn	�͂�	�n��\<NL>"
        \. "ho	��	�z\<NL>"
        \. "hp	�ق�	�z�E\<NL>"
        \. "hq	�͂�	�n�C\<NL>"
        \. "ht	�Ђ�	�q�g\<NL>"
        \. "hu	��	�t\<NL>"
        \. "hw	�ւ�	�w�C\<NL>"
        \. "hya	�Ђ�	�q��\<NL>"
        \. "hyd	�Ђ���	�q�F��\<NL>"
        \. "hye	�Ђ�	�q�F\<NL>"
        \. "hyh	�Ђイ	�q���E\<NL>"
        \. "hyi	�Ђ�	�q�B\<NL>"
        \. "hyl	�Ђ��	�q����\<NL>"
        \. "hyo	�Ђ�	�q��\<NL>"
        \. "hyp	�Ђ傤	�q���E\<NL>"
        \. "hyq	�ЂႢ	�q���C\<NL>"
        \. "hyu	�Ђ�	�q��\<NL>"
        \. "hyw	�Ђ���	�q�F�C\<NL>"
        \. "hyz	�Ђ��	�q����\<NL>"
        \. "hz	�͂�	�n��\<NL>"
        \. "i	��	�C\<NL>"
        \. "ja	����	�W��\<NL>"
        \. "jd	������	�W�F��\<NL>"
        \. "je	����	�W�F\<NL>"
        \. "jf	����	�W��\<NL>"
        \. "jh	���イ	�W���E\<NL>"
        \. "ji	��	�W\<NL>"
        \. "jj	�����	�W����\<NL>"
        \. "jk	����	�W��\<NL>"
        \. "jl	�����	�W����\<NL>"
        \. "jn	�����	�W����\<NL>"
        \. "jo	����	�W��\<NL>"
        \. "jp	���傤	�W���E\<NL>"
        \. "jq	���Ⴂ	�W���C\<NL>"
        \. "ju	����	�W��\<NL>"
        \. "jv	���イ	�W���E\<NL>"
        \. "jw	������	�W�F�C\<NL>"
        \. "jya	����	�W��\<NL>"
        \. "jye	����	�W�F\<NL>"
        \. "jyi	����	�W�B\<NL>"
        \. "jyo	����	�W��\<NL>"
        \. "jyu	����	�W��\<NL>"
        \. "jz	�����	�W����\<NL>"
        \. "kA	��	��\<NL>"
        \. "kE	��	��\<NL>"
        \. "ka	��	�J\<NL>"
        \. "kd	����	�P��\<NL>"
        \. "ke	��	�P\<NL>"
        \. "kf	��	�L\<NL>"
        \. "kga	����	�L��\<NL>"
        \. "kgd	������	�L�F��\<NL>"
        \. "kge	����	�L�F\<NL>"
        \. "kgh	���イ	�L���E\<NL>"
        \. "kgl	�����	�L����\<NL>"
        \. "kgn	�����	�L����\<NL>"
        \. "kgo	����	�L��\<NL>"
        \. "kgp	���傤	�L���E\<NL>"
        \. "kgq	���Ⴂ	�L���C\<NL>"
        \. "kgu	����	�L��\<NL>"
        \. "kgw	������	�L�F�C\<NL>"
        \. "kgz	�����	�L����\<NL>"
        \. "kh	����	�N�E\<NL>"
        \. "ki	��	�L\<NL>"
        \. "kj	����	�N��\<NL>"
        \. "kk	����	�L��\<NL>"
        \. "kl	����	�R��\<NL>"
        \. "km	��	�L\<NL>"
        \. "kn	����	�J��\<NL>"
        \. "ko	��	�R\<NL>"
        \. "kp	����	�R�E\<NL>"
        \. "kq	����	�J�C\<NL>"
        \. "kr	����	�J��\<NL>"
        \. "kt	����	�R�g\<NL>"
        \. "ku	��	�N\<NL>"
        \. "kv	����	�L��\<NL>"
        \. "kw	����	�P�C\<NL>"
        \. "kya	����	�L��\<NL>"
        \. "kyd	������	�L�F��\<NL>"
        \. "kye	����	�L�F\<NL>"
        \. "kyh	���イ	�L���E\<NL>"
        \. "kyi	����	�L�B\<NL>"
        \. "kyj	�����	�L����\<NL>"
        \. "kyl	�����	�L����\<NL>"
        \. "kyn	�����	�L����\<NL>"
        \. "kyo	����	�L��\<NL>"
        \. "kyp	���傤	�L���E\<NL>"
        \. "kyq	���Ⴂ	�L���C\<NL>"
        \. "kyu	����	�L��\<NL>"
        \. "kyw	������	�L�F�C\<NL>"
        \. "kyz	�����	�L����\<NL>"
        \. "kz	����	�J��\<NL>"
        \. "ma	��	�}\<NL>"
        \. "md	�߂�	����\<NL>"
        \. "me	��	��\<NL>"
        \. "mf	��	��\<NL>"
        \. "mga	�݂�	�~��\<NL>"
        \. "mgd	�݂���	�~�F��\<NL>"
        \. "mge	�݂�	�~�F\<NL>"
        \. "mgh	�݂イ	�~���E\<NL>"
        \. "mgj	�݂��	�~����\<NL>"
        \. "mgl	�݂��	�~����\<NL>"
        \. "mgn	�݂��	�~����\<NL>"
        \. "mgo	�݂�	�~��\<NL>"
        \. "mgp	�݂傤	�~���E\<NL>"
        \. "mgq	�݂Ⴂ	�~���C\<NL>"
        \. "mgu	�݂�	�~��\<NL>"
        \. "mgw	�݂���	�~�F�C\<NL>"
        \. "mgz	�݂��	�~����\<NL>"
        \. "mh	�ނ�	���E\<NL>"
        \. "mi	��	�~\<NL>"
        \. "mj	�ނ�	����\<NL>"
        \. "mk	�݂�	�~��\<NL>"
        \. "ml	����	����\<NL>"
        \. "mn	����	���m\<NL>"
        \. "mo	��	��\<NL>"
        \. "mp	����	���E\<NL>"
        \. "mq	�܂�	�}�C\<NL>"
        \. "mr	�܂�	�}��\<NL>"
        \. "ms	�܂�	�}�X\<NL>"
        \. "mt	�܂�	�}�^\<NL>"
        \. "mu	��	��\<NL>"
        \. "mv	�ނ�	����\<NL>"
        \. "mw	�߂�	���C\<NL>"
        \. "mya	�݂�	�~��\<NL>"
        \. "myd	�݂���	�~�F��\<NL>"
        \. "mye	�݂�	�~�F\<NL>"
        \. "myh	�݂イ	�~���E\<NL>"
        \. "myi	�݂�	�~�B\<NL>"
        \. "myj	�݂��	�~����\<NL>"
        \. "myl	�݂��	�~����\<NL>"
        \. "myn	�݂��	�~����\<NL>"
        \. "myo	�݂�	�~��\<NL>"
        \. "myp	�݂傤	�~���E\<NL>"
        \. "myq	�݂Ⴂ	�~���C\<NL>"
        \. "myu	�݂�	�~��\<NL>"
        \. "myw	�݂���	�~�F�C\<NL>"
        \. "myz	�݂��	�~����\<NL>"
        \. "mz	�܂�	�}��\<NL>"
        \. "n	��	��\<NL>"
        \. "na	��	�i\<NL>"
        \. "nb	�˂�	�l�o\<NL>"
        \. "nd	�˂�	�l��\<NL>"
        \. "ne	��	�l\<NL>"
        \. "nf	��	�k\<NL>"
        \. "nga	�ɂ�	�j��\<NL>"
        \. "ngd	�ɂ���	�j�F��\<NL>"
        \. "nge	�ɂ�	�j�F\<NL>"
        \. "ngh	�ɂイ	�j���E\<NL>"
        \. "ngj	�ɂ��	�j����\<NL>"
        \. "ngl	�ɂ��	�j����\<NL>"
        \. "ngn	�ɂ��	�j����\<NL>"
        \. "ngo	�ɂ�	�j��\<NL>"
        \. "ngp	�ɂ傤	�j���E\<NL>"
        \. "ngq	�ɂႢ	�j���C\<NL>"
        \. "ngu	�ɂ�	�j��\<NL>"
        \. "ngw	�ɂ���	�j�F�C\<NL>"
        \. "ngz	�ɂ��	�j����\<NL>"
        \. "nh	�ʂ�	�k�E\<NL>"
        \. "ni	��	�j\<NL>"
        \. "nj	�ʂ�	�k��\<NL>"
        \. "nk	�ɂ�	�j��\<NL>"
        \. "nl	�̂�	�m��\<NL>"
        \. "nn	��	��\<NL>"
        \. "no	��	�m\<NL>"
        \. "np	�̂�	�m�E\<NL>"
        \. "nq	�Ȃ�	�i�C\<NL>"
        \. "nr	�Ȃ�	�i��\<NL>"
        \. "nt	�ɂ�	�j�`\<NL>"
        \. "nu	��	�k\<NL>"
        \. "nv	�ʂ�	�k��\<NL>"
        \. "nw	�˂�	�l�C\<NL>"
        \. "nya	�ɂ�	�j��\<NL>"
        \. "nyd	�ɂ���	�j�F��\<NL>"
        \. "nye	�ɂ�	�j�F\<NL>"
        \. "nyh	�ɂイ	�j���E\<NL>"
        \. "nyi	�ɂ�	�j�B\<NL>"
        \. "nyj	�ɂ��	�j����\<NL>"
        \. "nyl	�ɂ��	�j����\<NL>"
        \. "nyn	�ɂ��	�j����\<NL>"
        \. "nyo	�ɂ�	�j��\<NL>"
        \. "nyp	�ɂ傤	�j���E\<NL>"
        \. "nyq	�ɂႢ	�j���C\<NL>"
        \. "nyu	�ɂ�	�j��\<NL>"
        \. "nyw	�ɂ���	�j�F�C\<NL>"
        \. "nyz	�ɂ��	�j����\<NL>"
        \. "nz	�Ȃ�	�i��\<NL>"
        \. "o	��	�I\<NL>"
        \. "pa	��	�p\<NL>"
        \. "pd	�؂�	�y��\<NL>"
        \. "pe	��	�y\<NL>"
        \. "pf	�ۂ�	�|��\<NL>"
        \. "pga	�҂�	�s��\<NL>"
        \. "pgd	�҂���	�s�F��\<NL>"
        \. "pge	�҂�	�s�F\<NL>"
        \. "pgh	�҂イ	�s���E\<NL>"
        \. "pgj	�҂��	�s����\<NL>"
        \. "pgl	�҂��	�s����\<NL>"
        \. "pgn	�҂��	�s����\<NL>"
        \. "pgo	�҂�	�s��\<NL>"
        \. "pgp	�҂傤	�s���E\<NL>"
        \. "pgq	�҂Ⴂ	�s���C\<NL>"
        \. "pgu	�҂�	�s��\<NL>"
        \. "pgw	�҂���	�s�F�C\<NL>"
        \. "pgz	�҂��	�s����\<NL>"
        \. "ph	�Ղ�	�v�E\<NL>"
        \. "pi	��	�s\<NL>"
        \. "pj	�Ղ�	�v��\<NL>"
        \. "pk	�҂�	�s��\<NL>"
        \. "pl	�ۂ�	�|��\<NL>"
        \. "pn	�ς�	�p��\<NL>"
        \. "po	��	�|\<NL>"
        \. "pp	�ۂ�	�|�E\<NL>"
        \. "pq	�ς�	�p�C\<NL>"
        \. "pu	��	�v\<NL>"
        \. "pv	�ۂ�	�|�E\<NL>"
        \. "pw	�؂�	�y�C\<NL>"
        \. "pya	�҂�	�s��\<NL>"
        \. "pyd	�҂���	�s�F��\<NL>"
        \. "pye	�҂�	�s�F\<NL>"
        \. "pyh	�҂イ	�s���E\<NL>"
        \. "pyi	�҂�	�s�B\<NL>"
        \. "pyj	�҂��	�s����\<NL>"
        \. "pyl	�҂��	�s����\<NL>"
        \. "pyn	�҂��	�s����\<NL>"
        \. "pyo	�҂�	�s��\<NL>"
        \. "pyp	�҂傤	�s���E\<NL>"
        \. "pyq	�҂Ⴂ	�s���C\<NL>"
        \. "pyu	�҂�	�s��\<NL>"
        \. "pyw	�҂���	�s�F�C\<NL>"
        \. "pyz	�҂��	�s����\<NL>"
        \. "pz	�ς�	�p��\<NL>"
        \. "ra	��	��\<NL>"
        \. "rd	���	����\<NL>"
        \. "re	��	��\<NL>"
        \. "rh	�邤	���E\<NL>"
        \. "ri	��	��\<NL>"
        \. "rj	���	����\<NL>"
        \. "rk	���	����\<NL>"
        \. "rl	���	����\<NL>"
        \. "rn	���	����\<NL>"
        \. "ro	��	��\<NL>"
        \. "rp	�낤	���E\<NL>"
        \. "rq	�炢	���C\<NL>"
        \. "rr	���	����\<NL>"
        \. "ru	��	��\<NL>"
        \. "rw	�ꂢ	���C\<NL>"
        \. "rya	���	����\<NL>"
        \. "ryd	�肥��	���F��\<NL>"
        \. "rye	�肥	���F\<NL>"
        \. "ryh	��イ	�����E\<NL>"
        \. "ryi	�股	���B\<NL>"
        \. "ryj	����	������\<NL>"
        \. "ryk	��傭	�����N\<NL>"
        \. "ryl	����	������\<NL>"
        \. "ryn	����	������\<NL>"
        \. "ryo	���	����\<NL>"
        \. "ryp	��傤	�����E\<NL>"
        \. "ryq	��Ⴂ	�����C\<NL>"
        \. "ryu	���	����\<NL>"
        \. "ryw	�肥��	���F�C\<NL>"
        \. "ryz	����	������\<NL>"
        \. "rz	���	����\<NL>"
        \. "sa	��	�T\<NL>"
        \. "sd	����	�Z��\<NL>"
        \. "se	��	�Z\<NL>"
        \. "sf	����	�T�C\<NL>"
        \. "sh	����	�X�E\<NL>"
        \. "si	��	�V\<NL>"
        \. "sj	����	�X��\<NL>"
        \. "sk	����	�V��\<NL>"
        \. "sl	����	�\��\<NL>"
        \. "sm	����	�V��\<NL>"
        \. "sn	����	�T��\<NL>"
        \. "so	��	�\\<NL>"
        \. "sp	����	�\�E\<NL>"
        \. "sq	����	�T�C\<NL>"
        \. "sr	����	�X��\<NL>"
        \. "ss	����	�Z�C\<NL>"
        \. "st	����	�V�^\<NL>"
        \. "su	��	�X\<NL>"
        \. "sv	����	�T�C\<NL>"
        \. "sw	����	�Z�C\<NL>"
        \. "sya	����	�V��\<NL>"
        \. "syd	������	�V�F��\<NL>"
        \. "sye	����	�V�F\<NL>"
        \. "syh	���イ	�V���E\<NL>"
        \. "syi	����	�V�B\<NL>"
        \. "syj	�����	�V����\<NL>"
        \. "syl	�����	�V����\<NL>"
        \. "syo	����	�V��\<NL>"
        \. "syp	���傤	�V���E\<NL>"
        \. "syq	���Ⴂ	�V���C\<NL>"
        \. "syu	����	�V��\<NL>"
        \. "syw	������	�V�F�C\<NL>"
        \. "syz	�����	�V����\<NL>"
        \. "sz	����	�T��\<NL>"
        \. "tU	��	�b\<NL>"
        \. "ta	��	�^\<NL>"
        \. "tb	����	�^�r\<NL>"
        \. "td	�Ă�	�e��\<NL>"
        \. "te	��	�e\<NL>"
        \. "tgh	�Ă�	�e���[\<NL>"
        \. "tgi	�Ă�	�e�B\<NL>"
        \. "tgk	�Ă���	�e�B��\<NL>"
        \. "tgp	�Ƃ�	�g�D�[\<NL>"
        \. "tgu	�Ă�	�e��\<NL>"
        \. "th	��	�c�E\<NL>"
        \. "ti	��	�`\<NL>"
        \. "tj	��	�c��\<NL>"
        \. "tk	����	�`��\<NL>"
        \. "tl	�Ƃ�	�g��\<NL>"
        \. "tm	����	�^��\<NL>"
        \. "tn	����	�^��\<NL>"
        \. "to	��	�g\<NL>"
        \. "tp	�Ƃ�	�g�E\<NL>"
        \. "tq	����	�^�C\<NL>"
        \. "tr	����	�^��\<NL>"
        \. "tsU	��	�b\<NL>"
        \. "tsa	��	�c�@\<NL>"
        \. "tse	��	�c�F\<NL>"
        \. "tsi	��	�c�B\<NL>"
        \. "tso	��	�c�H\<NL>"
        \. "tsu	��	�c\<NL>"
        \. "tt	����	�^�`\<NL>"
        \. "tu	��	�c\<NL>"
        \. "tw	�Ă�	�e�C\<NL>"
        \. "tya	����	�`��\<NL>"
        \. "tyd	������	�`�F��\<NL>"
        \. "tye	����	�`�F\<NL>"
        \. "tyh	���イ	�`���E\<NL>"
        \. "tyi	����	�`�B\<NL>"
        \. "tyj	�����	�`����\<NL>"
        \. "tyl	�����	�`����\<NL>"
        \. "tyn	�����	�`����\<NL>"
        \. "tyo	����	�`��\<NL>"
        \. "typ	���傤	�`���E\<NL>"
        \. "tyq	���Ⴂ	�`���C\<NL>"
        \. "tyu	����	�`��\<NL>"
        \. "tyw	������	�`�F�C\<NL>"
        \. "tyz	�����	�`����\<NL>"
        \. "tz	����	�^��\<NL>"
        \. "u	��	�E\<NL>"
        \. "va	���J��	���@\<NL>"
        \. "vd	��	���F��\<NL>"
        \. "ve	���J��	���F\<NL>"
        \. "vi	���J��	���B\<NL>"
        \. "vk	��	���B��\<NL>"
        \. "vl	��	���H��\<NL>"
        \. "vn	��	���@��\<NL>"
        \. "vo	���J��	���H\<NL>"
        \. "vp	��	���H�[\<NL>"
        \. "vq	��	���@�C\<NL>"
        \. "vu	���J	��\<NL>"
        \. "vw	��	���F�C\<NL>"
        \. "vya	��	����\<NL>"
        \. "vye	��	���F\<NL>"
        \. "vyo	��	����\<NL>"
        \. "vyu	��	����\<NL>"
        \. "vz	��	���@��\<NL>"
        \. "wA	��	��\<NL>"
        \. "wa	��	��\<NL>"
        \. "wd	������	�E�F��\<NL>"
        \. "we	����	�E�F\<NL>"
        \. "wf	��	��\<NL>"
        \. "wha	����	�E�@\<NL>"
        \. "whe	����	�E�F\<NL>"
        \. "whi	����	�E�B\<NL>"
        \. "who	����	�E�H\<NL>"
        \. "whu	��	�E\<NL>"
        \. "wi	����	�E�B\<NL>"
        \. "wk	������	�E�B��\<NL>"
        \. "wl	������	�E�H��\<NL>"
        \. "wn	���	����\<NL>"
        \. "wo	��	��\<NL>"
        \. "wp	����	�E�H�[\<NL>"
        \. "wq	�킢	���C\<NL>"
        \. "wr	���	����\<NL>"
        \. "wso	����	�E�H\<NL>"
        \. "wt	�킽	���^\<NL>"
        \. "wu	��	�E\<NL>"
        \. "wz	���	����\<NL>"
        \. "xa	����	�V��\<NL>"
        \. "xc	����	�V��\<NL>"
        \. "xd	������	�V�F��\<NL>"
        \. "xe	����	�V�F\<NL>"
        \. "xf	������	�V�F�C\<NL>"
        \. "xh	���イ	�V���E\<NL>"
        \. "xi	��	�V\<NL>"
        \. "xj	�����	�V����\<NL>"
        \. "xk	����	�V��\<NL>"
        \. "xka	��	��\<NL>"
        \. "xke	��	��\<NL>"
        \. "xl	�����	�V����\<NL>"
        \. "xn	�����	�V����\<NL>"
        \. "xo	����	�V��\<NL>"
        \. "xp	���傤	�V���E\<NL>"
        \. "xq	���Ⴂ	�V���C\<NL>"
        \. "xt	�����	�V���c\<NL>"
        \. "xtsu	��	�b\<NL>"
        \. "xtu	��	�b\<NL>"
        \. "xu	����	�V��\<NL>"
        \. "xv	���Ⴂ	�V���C\<NL>"
        \. "xw	������	�V�F�C\<NL>"
        \. "xwa	��	��\<NL>"
        \. "xwe	��	��\<NL>"
        \. "xwi	��	��\<NL>"
        \. "xxa	��	�@\<NL>"
        \. "xxe	��	�F\<NL>"
        \. "xxi	��	�B\<NL>"
        \. "xxo	��	�H\<NL>"
        \. "xxu	��	�D\<NL>"
        \. "xya	��	��\<NL>"
        \. "xyo	��	��\<NL>"
        \. "xyu	��	��\<NL>"
        \. "xz	�����	�V����\<NL>"
        \. "ya	��	��\<NL>"
        \. "ye	����	�C�F\<NL>"
        \. "yh	�䂤	���E\<NL>"
        \. "yi	��	�C\<NL>"
        \. "yi	��	��\<NL>"
        \. "yj	���	����\<NL>"
        \. "yl	���	����\<NL>"
        \. "yn	���	����\<NL>"
        \. "yo	��	��\<NL>"
        \. "yp	�悤	���E\<NL>"
        \. "yq	�₢	���C\<NL>"
        \. "yr	���	����\<NL>"
        \. "yu	��	��\<NL>"
        \. "yv	�䂤	���E\<NL>"
        \. "yz	���	����\<NL>"
        \. "z,	�d\<NL>"
        \. "z-	�`\<NL>"
        \. "z.	�c\<NL>"
        \. "z/	�E\<NL>"
        \. "z[	�w\<NL>"
        \. "z]	�x\<NL>"
        \. "za	��	�U\<NL>"
        \. "zc	��	�U\<NL>"
        \. "zd	����	�[��\<NL>"
        \. "ze	��	�[\<NL>"
        \. "zf	��	�[\<NL>"
        \. "zh	��\<NL>"
        \. "zh	����	�Y�E\<NL>"
        \. "zi	��	�W\<NL>"
        \. "zj	��\<NL>"
        \. "zj	����	�Y��\<NL>"
        \. "zk	��\<NL>"
        \. "zk	����	�W��\<NL>"
        \. "zl	��\<NL>"
        \. "zl	����	�]��\<NL>"
        \. "zn	����	�U��\<NL>"
        \. "zo	��	�]\<NL>"
        \. "zp	����	�]�E\<NL>"
        \. "zq	����	�U�C\<NL>"
        \. "zr	����	�U��\<NL>"
        \. "zu	��	�Y\<NL>"
        \. "zv	����	�U�C\<NL>"
        \. "zw	����	�[�C\<NL>"
        \. "zx	����	�[�C\<NL>"
        \. "zya	����	�W��\<NL>"
        \. "zyd	������	�W�F��\<NL>"
        \. "zye	����	�W�F\<NL>"
        \. "zyh	���イ	�W���E\<NL>"
        \. "zyi	����	�W�B\<NL>"
        \. "zyj	�����	�W����\<NL>"
        \. "zyl	�����	�W����\<NL>"
        \. "zyn	�����	�W����\<NL>"
        \. "zyo	����	�W��\<NL>"
        \. "zyp	���傤	�W���E\<NL>"
        \. "zyq	���Ⴂ	�W���C\<NL>"
        \. "zyu	����	�W��\<NL>"
        \. "zyw	������	�W�F�C\<NL>"
        \. "zyz	�����	�W����\<NL>"
        \. "zz	����	�U��\<NL>"
        \. "-	�[\<NL>"
        \. ":	�F\<NL>"
        \. "[	�u\<NL>"
        \. "]	�v\<NL>"
  let skk_rom_func_rules = ""
        \. ".	SkkCurrentKuten(kana)\<NL>"
        \. ",	SkkCurrentTouten(kana)\<NL>"
        \. "l	SkkAsciiMode(kana)\<NL>"
        \. "L	SkkZeneiMode(kana)\<NL>"
        \. "@	SkkToggleKana(kana)\<NL>"
        \. "`	SkkSetHenkanPoint1(kana)\<NL>"
        \. "/	SkkAbbrevMode(kana)\<NL>"
endif

if dein#tap('unite.vim')
  nnoremap    [unite]   <Nop>
  nmap    <Leader> [unite]

  nnoremap [unite]u  :<C-u>Unite<Space>
  nnoremap <silent> [unite], :<C-u>Unite -buffer-name=all buffer file_mru bookmark file file/new directory/new -start-insert<CR>
  nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=buffers buffer -start-insert -immediately<CR>
  nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=command command -start-insert -immediately<CR>
  nnoremap <silent> [unite]d :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file file/new directory/new -start-insert<CR>
  nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_mru file_rec file/new directory/new -start-insert<CR>
  nnoremap <silent> [unite]g :<C-u>UniteWithBufferDir -buffer-name=grep grep<CR>
  nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru -start-insert<CR>
  nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
  nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=source source -start-insert<CR>
  nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline outline -start-insert<CR>
  nnoremap <silent> [unite]A :<C-u>UniteBookmarkAdd<CR>
  nnoremap <silent> [unite]B :<C-u>Unite -buffer-name=bookmark bookmark -start-insert -immediately<CR>
  nnoremap <silent> [unite]C :<C-u>Unite -buffer-name=history/command history/command -start-insert -immediately<CR>
  nnoremap <silent> [unite]D :<C-u>UniteWithBufferDir -buffer-name=files file_rec -start-insert<CR>
  nnoremap <silent> [unite]H :<C-u>UniteWithCursorWord -buffer-name=helps tag help -start-insert -immediately<CR>

  autocmd MyAutoCmd FileType unite call s:unite_my_settings()
  function! s:unite_my_settings()
    " Overwrite settings.
    nmap <buffer> <ESC>      <Plug>(unite_exit)
    imap <buffer> jj      <Plug>(unite_insert_leave)

    " <C-l>: manual neocomplcache completion.
    inoremap <buffer> <C-l>  <C-x><C-u><C-p><Down>

    imap <buffer><expr><BS> col('.') == 2 ? "\<Plug>(unite_exit)" : "\<C-h>"

    " fuf like
    nnoremap <silent><buffer> <C-@> :<C-u>call unite#mappings#do_action('preview')<CR>
    nnoremap <silent><buffer> <C-j> :<C-u>call unite#mappings#do_action('split')<CR>
    nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('vsplit')<CR>
    nnoremap <silent><buffer> <C-j> :<C-u>call unite#mappings#do_action('above')<CR>
    nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('right')<CR>
  endfunction

  let g:unite_enable_start_insert = 0
  let g:unite_source_file_mru_limit = 200
  let g:unite_source_history_yank_enable = 1
  let g:unite_data_directory = s:dot_vim_dir . '/.unite'

  let g:unite_cursor_line_highlight = 'PmenuSel'
  let g:unite_abbr_highlight = 'Pmenu'

  let g:unite_source_file_mru_filename_format = ''
  let g:unite_source_file_mru_time_format = ''
endif

if dein#tap('vim-operator-user')
  map R <Plug>(operator-replace)
  map S <Plug>(operator-sort)
  map y <Plug>(operator-flashy)
  nmap Y <Plug>(operator-flashy)$
endif

if dein#tap('vim-operator-surround')
  map <silent>sa <Plug>(operator-surround-append)
  map <silent>sd <Plug>(operator-surround-delete)
  map <silent>sr <Plug>(operator-surround-replace)

  nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
  nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)
endif

if dein#tap('vim-smartword')
  " <http://d.hatena.ne.jp/ns9tks/20090122/1232642747>
  map w  <Plug>(smartword-w)
  map b  <Plug>(smartword-b)
  map e  <Plug>(smartword-e)
  map ge <Plug>(smartword-ge)
  noremap W  w
  noremap B  b
  noremap E  e
  noremap gE ge
endif

if dein#tap('lightline.vim')
  let g:unite_force_overwrite_statusline = 0
endif

if dein#tap('incsearch.vim')
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
endif

if dein#tap('indentLine')
  let g:indentLine_faster = 1
endif

filetype plugin indent on
syntax enable
