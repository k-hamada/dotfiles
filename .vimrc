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

  call dein#add('ShaderHighLight')

  call dein#add('tyru/restart.vim')
  call dein#add('tpope/vim-repeat')

  call dein#add('Yggdroot/indentLine')
  call dein#add('itchyny/lightline.vim')

  call dein#add('plasticboy/vim-markdown')
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
        \. "(	（\<NL>"
        \. ")	）\<NL>"
        \. ":	っ	ッ	\<NL>"
        \. "q	ん	ン\<NL>"
        \. "z:	：\<NL>"
        \. "z;	；\<NL>"
        \. "z-	ー\<NL>"
        \. "*	ー\<NL>"
        \. "~	〜\<NL>"
        \. "tt	っ	ッ	t\<NL>"
  let skk_rom_kana_rules = ""
        \. ";	っ	ッ\<NL>"
        \. "a	あ	ア\<NL>"
        \. "ba	ば	バ\<NL>"
        \. "bd	べん	ベン\<NL>"
        \. "be	べ	ベ\<NL>"
        \. "bh	ぶう	ブウ\<NL>"
        \. "bi	び	ビ\<NL>"
        \. "bj	ぶん	ブン\<NL>"
        \. "bk	びん	ビン\<NL>"
        \. "bl	ぼん	ボン\<NL>"
        \. "bn	ばん	バン\<NL>"
        \. "bo	ぼ	ボ\<NL>"
        \. "bp	ぼう	ボウ\<NL>"
        \. "bq	ばい	バイ\<NL>"
        \. "br	ばら	バラ\<NL>"
        \. "bt	びと	ビト\<NL>"
        \. "bu	ぶ	ブ\<NL>"
        \. "bw	べい	ベイ\<NL>"
        \. "bx	べい	ベイ\<NL>"
        \. "bya	びゃ	ビャ\<NL>"
        \. "byd	びぇん	ビェン\<NL>"
        \. "bye	びぇ	ビェ\<NL>"
        \. "byh	びゅう	ビュウ\<NL>"
        \. "byi	びぃ	ビィ\<NL>"
        \. "byj	びゅん	ビュン\<NL>"
        \. "byl	びょん	ビョン\<NL>"
        \. "byn	びゃん	ビャン\<NL>"
        \. "byo	びょ	ビョ\<NL>"
        \. "byp	びょう	ビョウ\<NL>"
        \. "byq	びゃい	ビャイ\<NL>"
        \. "byu	びゅ	ビュ\<NL>"
        \. "byw	びぇい	ビェイ\<NL>"
        \. "byz	びゃん	ビャン\<NL>"
        \. "bz	ばん	バン\<NL>"
        \. "ca	ちゃ	チャ\<NL>"
        \. "cc	ちゃ	チャ\<NL>"
        \. "cd	ちぇん	チェン\<NL>"
        \. "ce	ちぇ	チェ\<NL>"
        \. "cf	ちぇ	チェ\<NL>"
        \. "ch	ちゅう	チュウ\<NL>"
        \. "ci	ち	チ\<NL>"
        \. "cj	ちゅん	チュン\<NL>"
        \. "ck	ちん	チン\<NL>"
        \. "cl	ちょん	チョン\<NL>"
        \. "cn	ちゃん	チャン\<NL>"
        \. "co	ちょ	チョ\<NL>"
        \. "cp	ちょう	チョウ\<NL>"
        \. "cq	ちゃい	チャイ\<NL>"
        \. "cu	ちゅ	チュ\<NL>"
        \. "cv	ちゃい	チャイ\<NL>"
        \. "cw	ちぇい	チェイ\<NL>"
        \. "cx	ちぇい	チェイ\<NL>"
        \. "cya	ちゃ	チャ\<NL>"
        \. "cye	ちぇ	チェ\<NL>"
        \. "cyi	ちぃ	チィ\<NL>"
        \. "cyo	ちょ	チョ\<NL>"
        \. "cyu	ちゅ	チュ\<NL>"
        \. "cz	ちゃん	チャン\<NL>"
        \. "da	だ	ダ\<NL>"
        \. "dch	でゅ	デュー\<NL>"
        \. "dci	でぃ	ディ\<NL>"
        \. "dck	でぃん	ディン\<NL>"
        \. "dcp	どぅ	ドゥー\<NL>"
        \. "dcu	でゅ	デュ\<NL>"
        \. "dd	でん	デン\<NL>"
        \. "de	で	デ\<NL>"
        \. "df	で	デ\<NL>"
        \. "dg	だが	ダガ\<NL>"
        \. "dh	づう	ヅウ\<NL>"
        \. "dha	でゃ	デャ\<NL>"
        \. "dhe	でぇ	デェ\<NL>"
        \. "dhi	でぃ	ディ\<NL>"
        \. "dho	でょ	デョ\<NL>"
        \. "dhu	でゅ	デュ\<NL>"
        \. "di	ぢ	ヂ\<NL>"
        \. "dj	づん	ヅン\<NL>"
        \. "dk	ぢん	ヂン\<NL>"
        \. "dl	どん	ドン\<NL>"
        \. "dm	でも	デモ\<NL>"
        \. "dn	だん	ダン\<NL>"
        \. "do	ど	ド\<NL>"
        \. "dp	どう	ドウ\<NL>"
        \. "dq	だい	ダイ\<NL>"
        \. "dr	である	デアル\<NL>"
        \. "ds	です	デス\<NL>"
        \. "dt	だち	ダチ\<NL>"
        \. "du	づ	ヅ\<NL>"
        \. "dv	でん	デン\<NL>"
        \. "dw	でい	デイ\<NL>"
        \. "dy	でぃ	ディ\<NL>"
        \. "dya	ぢゃ	ヂャ\<NL>"
        \. "dye	ぢぇ	ヂェ\<NL>"
        \. "dyi	ぢぃ	ヂィ\<NL>"
        \. "dyo	ぢょ	ヂョ\<NL>"
        \. "dyu	ぢゅ	ヂュ\<NL>"
        \. "dz	だん	ダン\<NL>"
        \. "e	え	エ\<NL>"
        \. "fa	ふぁ	ファ\<NL>"
        \. "fd	ふぇん	フェン\<NL>"
        \. "fe	ふぇ	フェ\<NL>"
        \. "fh	ふう	フウ\<NL>"
        \. "fi	ふぃ	フィ\<NL>"
        \. "fj	ふん	フン\<NL>"
        \. "fk	ふぃん	フィン\<NL>"
        \. "fl	ふぉん	フォン\<NL>"
        \. "fm	ふむ	フム\<NL>"
        \. "fn	ふぁん	ファン\<NL>"
        \. "fo	ふぉ	フォ\<NL>"
        \. "fp	ふぉ	フォー\<NL>"
        \. "fq	ふぁい	ファイ\<NL>"
        \. "fr	ふる	フル\<NL>"
        \. "fs	ふぁい	ファイ\<NL>"
        \. "fu	ふ	フ\<NL>"
        \. "fw	ふぇい	フェイ\<NL>"
        \. "fya	ふゃ	フャ\<NL>"
        \. "fye	ふぇ	フェ\<NL>"
        \. "fyi	ふぃ	フィ\<NL>"
        \. "fyo	ふょ	フョ\<NL>"
        \. "fyu	ふゅ	フュ\<NL>"
        \. "fz	ふぁん	ファン\<NL>"
        \. "ga	が	ガ\<NL>"
        \. "gd	げん	ゲン\<NL>"
        \. "ge	げ	ゲ\<NL>"
        \. "gh	ぐう	グウ\<NL>"
        \. "gi	ぎ	ギ\<NL>"
        \. "gj	ぐん	グン\<NL>"
        \. "gk	ぎん	ギン\<NL>"
        \. "gl	ごん	ゴン\<NL>"
        \. "gn	がん	ガン\<NL>"
        \. "go	ご	ゴ\<NL>"
        \. "gp	ごう	ゴウ\<NL>"
        \. "gq	がい	ガイ\<NL>"
        \. "gr	がら	ガラ\<NL>"
        \. "gt	ごと	ゴト\<NL>"
        \. "gu	ぐ	グ\<NL>"
        \. "gw	げい	ゲイ\<NL>"
        \. "gya	ぎゃ	ギャ\<NL>"
        \. "gyd	ぎぇん	ギェン\<NL>"
        \. "gye	ぎぇ	ギェ\<NL>"
        \. "gyh	ぎゅう	ギュウ\<NL>"
        \. "gyi	ぎぃ	ギィ\<NL>"
        \. "gyj	ぎゅん	ギュン\<NL>"
        \. "gyl	ぎょん	ギョン\<NL>"
        \. "gyn	ぎゃん	ギャン\<NL>"
        \. "gyo	ぎょ	ギョ\<NL>"
        \. "gyp	ぎょう	ギョウ\<NL>"
        \. "gyq	ぎゃい	ギャイ\<NL>"
        \. "gyu	ぎゅ	ギュ\<NL>"
        \. "gyw	ぎぇい	ギェイ\<NL>"
        \. "gyz	ぎゃん	ギャン\<NL>"
        \. "gz	がん	ガン\<NL>"
        \. "ha	は	ハ\<NL>"
        \. "hd	へん	ヘン\<NL>"
        \. "he	へ	ヘ\<NL>"
        \. "hf	ふ	フ\<NL>"
        \. "hga	ひゃ	ヒャ\<NL>"
        \. "hgd	ひぇん	ヒェン\<NL>"
        \. "hge	ひぇ	ヒェ\<NL>"
        \. "hgh	ひゅう	ヒュウ\<NL>"
        \. "hgj	ひゅん	ヒュン\<NL>"
        \. "hgl	ひょん	ヒョン\<NL>"
        \. "hgn	ひゃん	ヒャン\<NL>"
        \. "hgo	ひょ	ヒョ\<NL>"
        \. "hgp	ひょう	ヒョウ\<NL>"
        \. "hgq	ひゃい	ヒャイ\<NL>"
        \. "hgu	ひゅ	ヒュ\<NL>"
        \. "hgw	ひぇい	ヒェイ\<NL>"
        \. "hgz	ひゃん	ヒャン\<NL>"
        \. "hh	ふう	フウ\<NL>"
        \. "hi	ひ	ヒ\<NL>"
        \. "hj	ふん	フン\<NL>"
        \. "hk	ひん	ヒン\<NL>"
        \. "hl	ほん	ホン\<NL>"
        \. "hn	はん	ハン\<NL>"
        \. "ho	ほ	ホ\<NL>"
        \. "hp	ほう	ホウ\<NL>"
        \. "hq	はい	ハイ\<NL>"
        \. "ht	ひと	ヒト\<NL>"
        \. "hu	ふ	フ\<NL>"
        \. "hw	へい	ヘイ\<NL>"
        \. "hya	ひゃ	ヒャ\<NL>"
        \. "hyd	ひぇん	ヒェン\<NL>"
        \. "hye	ひぇ	ヒェ\<NL>"
        \. "hyh	ひゅう	ヒュウ\<NL>"
        \. "hyi	ひぃ	ヒィ\<NL>"
        \. "hyl	ひょん	ヒョン\<NL>"
        \. "hyo	ひょ	ヒョ\<NL>"
        \. "hyp	ひょう	ヒョウ\<NL>"
        \. "hyq	ひゃい	ヒャイ\<NL>"
        \. "hyu	ひゅ	ヒュ\<NL>"
        \. "hyw	ひぇい	ヒェイ\<NL>"
        \. "hyz	ひゃん	ヒャン\<NL>"
        \. "hz	はん	ハン\<NL>"
        \. "i	い	イ\<NL>"
        \. "ja	じゃ	ジャ\<NL>"
        \. "jd	じぇん	ジェン\<NL>"
        \. "je	じぇ	ジェ\<NL>"
        \. "jf	じゅ	ジュ\<NL>"
        \. "jh	じゅう	ジュウ\<NL>"
        \. "ji	じ	ジ\<NL>"
        \. "jj	じゅん	ジュン\<NL>"
        \. "jk	じん	ジン\<NL>"
        \. "jl	じょん	ジョン\<NL>"
        \. "jn	じゃん	ジャン\<NL>"
        \. "jo	じょ	ジョ\<NL>"
        \. "jp	じょう	ジョウ\<NL>"
        \. "jq	じゃい	ジャイ\<NL>"
        \. "ju	じゅ	ジュ\<NL>"
        \. "jv	じゅう	ジュウ\<NL>"
        \. "jw	じぇい	ジェイ\<NL>"
        \. "jya	じゃ	ジャ\<NL>"
        \. "jye	じぇ	ジェ\<NL>"
        \. "jyi	じぃ	ジィ\<NL>"
        \. "jyo	じょ	ジョ\<NL>"
        \. "jyu	じゅ	ジュ\<NL>"
        \. "jz	じゃん	ジャン\<NL>"
        \. "kA	ヵ	ヵ\<NL>"
        \. "kE	ヶ	ヶ\<NL>"
        \. "ka	か	カ\<NL>"
        \. "kd	けん	ケン\<NL>"
        \. "ke	け	ケ\<NL>"
        \. "kf	き	キ\<NL>"
        \. "kga	きゃ	キャ\<NL>"
        \. "kgd	きぇん	キェン\<NL>"
        \. "kge	きぇ	キェ\<NL>"
        \. "kgh	きゅう	キュウ\<NL>"
        \. "kgl	きょん	キョン\<NL>"
        \. "kgn	きゃん	キャン\<NL>"
        \. "kgo	きょ	キョ\<NL>"
        \. "kgp	きょう	キョウ\<NL>"
        \. "kgq	きゃい	キャイ\<NL>"
        \. "kgu	きゅ	キュ\<NL>"
        \. "kgw	きぇい	キェイ\<NL>"
        \. "kgz	きゃん	キャン\<NL>"
        \. "kh	くう	クウ\<NL>"
        \. "ki	き	キ\<NL>"
        \. "kj	くん	クン\<NL>"
        \. "kk	きん	キン\<NL>"
        \. "kl	こん	コン\<NL>"
        \. "km	き	キ\<NL>"
        \. "kn	かん	カン\<NL>"
        \. "ko	こ	コ\<NL>"
        \. "kp	こう	コウ\<NL>"
        \. "kq	かい	カイ\<NL>"
        \. "kr	から	カラ\<NL>"
        \. "kt	こと	コト\<NL>"
        \. "ku	く	ク\<NL>"
        \. "kv	きん	キン\<NL>"
        \. "kw	けい	ケイ\<NL>"
        \. "kya	きゃ	キャ\<NL>"
        \. "kyd	きぇん	キェン\<NL>"
        \. "kye	きぇ	キェ\<NL>"
        \. "kyh	きゅう	キュウ\<NL>"
        \. "kyi	きぃ	キィ\<NL>"
        \. "kyj	きゅん	キュン\<NL>"
        \. "kyl	きょん	キョン\<NL>"
        \. "kyn	きゃん	キャン\<NL>"
        \. "kyo	きょ	キョ\<NL>"
        \. "kyp	きょう	キョウ\<NL>"
        \. "kyq	きゃい	キャイ\<NL>"
        \. "kyu	きゅ	キュ\<NL>"
        \. "kyw	きぇい	キェイ\<NL>"
        \. "kyz	きゃん	キャン\<NL>"
        \. "kz	かん	カン\<NL>"
        \. "ma	ま	マ\<NL>"
        \. "md	めん	メン\<NL>"
        \. "me	め	メ\<NL>"
        \. "mf	む	ム\<NL>"
        \. "mga	みゃ	ミャ\<NL>"
        \. "mgd	みぇん	ミェン\<NL>"
        \. "mge	みぇ	ミェ\<NL>"
        \. "mgh	みゅう	ミュウ\<NL>"
        \. "mgj	みゅん	ミュン\<NL>"
        \. "mgl	みょん	ミョン\<NL>"
        \. "mgn	みゃん	ミャン\<NL>"
        \. "mgo	みょ	ミョ\<NL>"
        \. "mgp	みょう	ミョウ\<NL>"
        \. "mgq	みゃい	ミャイ\<NL>"
        \. "mgu	みゅ	ミュ\<NL>"
        \. "mgw	みぇい	ミェイ\<NL>"
        \. "mgz	みゃん	ミャン\<NL>"
        \. "mh	むう	ムウ\<NL>"
        \. "mi	み	ミ\<NL>"
        \. "mj	むん	ムン\<NL>"
        \. "mk	みん	ミン\<NL>"
        \. "ml	もん	モン\<NL>"
        \. "mn	もの	モノ\<NL>"
        \. "mo	も	モ\<NL>"
        \. "mp	もう	モウ\<NL>"
        \. "mq	まい	マイ\<NL>"
        \. "mr	まる	マル\<NL>"
        \. "ms	ます	マス\<NL>"
        \. "mt	また	マタ\<NL>"
        \. "mu	む	ム\<NL>"
        \. "mv	むん	ムン\<NL>"
        \. "mw	めい	メイ\<NL>"
        \. "mya	みゃ	ミャ\<NL>"
        \. "myd	みぇん	ミェン\<NL>"
        \. "mye	みぇ	ミェ\<NL>"
        \. "myh	みゅう	ミュウ\<NL>"
        \. "myi	みぃ	ミィ\<NL>"
        \. "myj	みゅん	ミュン\<NL>"
        \. "myl	みょん	ミョン\<NL>"
        \. "myn	みゃん	ミャン\<NL>"
        \. "myo	みょ	ミョ\<NL>"
        \. "myp	みょう	ミョウ\<NL>"
        \. "myq	みゃい	ミャイ\<NL>"
        \. "myu	みゅ	ミュ\<NL>"
        \. "myw	みぇい	ミェイ\<NL>"
        \. "myz	みゃん	ミャン\<NL>"
        \. "mz	まん	マン\<NL>"
        \. "n	ん	ン\<NL>"
        \. "na	な	ナ\<NL>"
        \. "nb	ねば	ネバ\<NL>"
        \. "nd	ねん	ネン\<NL>"
        \. "ne	ね	ネ\<NL>"
        \. "nf	ぬ	ヌ\<NL>"
        \. "nga	にゃ	ニャ\<NL>"
        \. "ngd	にぇん	ニェン\<NL>"
        \. "nge	にぇ	ニェ\<NL>"
        \. "ngh	にゅう	ニュウ\<NL>"
        \. "ngj	にゅん	ニュン\<NL>"
        \. "ngl	にょん	ニョン\<NL>"
        \. "ngn	にゃん	ニャン\<NL>"
        \. "ngo	にょ	ニョ\<NL>"
        \. "ngp	にょう	ニョウ\<NL>"
        \. "ngq	にゃい	ニャイ\<NL>"
        \. "ngu	にゅ	ニュ\<NL>"
        \. "ngw	にぇい	ニェイ\<NL>"
        \. "ngz	にゃん	ニャン\<NL>"
        \. "nh	ぬう	ヌウ\<NL>"
        \. "ni	に	ニ\<NL>"
        \. "nj	ぬん	ヌン\<NL>"
        \. "nk	にん	ニン\<NL>"
        \. "nl	のん	ノン\<NL>"
        \. "nn	ん	ン\<NL>"
        \. "no	の	ノ\<NL>"
        \. "np	のう	ノウ\<NL>"
        \. "nq	ない	ナイ\<NL>"
        \. "nr	なる	ナル\<NL>"
        \. "nt	にち	ニチ\<NL>"
        \. "nu	ぬ	ヌ\<NL>"
        \. "nv	ぬん	ヌン\<NL>"
        \. "nw	ねい	ネイ\<NL>"
        \. "nya	にゃ	ニャ\<NL>"
        \. "nyd	にぇん	ニェン\<NL>"
        \. "nye	にぇ	ニェ\<NL>"
        \. "nyh	にゅう	ニュウ\<NL>"
        \. "nyi	にぃ	ニィ\<NL>"
        \. "nyj	にゅん	ニュン\<NL>"
        \. "nyl	にょん	ニョン\<NL>"
        \. "nyn	にゃん	ニャン\<NL>"
        \. "nyo	にょ	ニョ\<NL>"
        \. "nyp	にょう	ニョウ\<NL>"
        \. "nyq	にゃい	ニャイ\<NL>"
        \. "nyu	にゅ	ニュ\<NL>"
        \. "nyw	にぇい	ニェイ\<NL>"
        \. "nyz	にゃん	ニャン\<NL>"
        \. "nz	なん	ナン\<NL>"
        \. "o	お	オ\<NL>"
        \. "pa	ぱ	パ\<NL>"
        \. "pd	ぺん	ペン\<NL>"
        \. "pe	ぺ	ペ\<NL>"
        \. "pf	ぽん	ポン\<NL>"
        \. "pga	ぴゃ	ピャ\<NL>"
        \. "pgd	ぴぇん	ピェン\<NL>"
        \. "pge	ぴぇ	ピェ\<NL>"
        \. "pgh	ぴゅう	ピュウ\<NL>"
        \. "pgj	ぴゅん	ピュン\<NL>"
        \. "pgl	ぴょん	ピョン\<NL>"
        \. "pgn	ぴゃん	ピャン\<NL>"
        \. "pgo	ぴょ	ピョ\<NL>"
        \. "pgp	ぴょう	ピョウ\<NL>"
        \. "pgq	ぴゃい	ピャイ\<NL>"
        \. "pgu	ぴゅ	ピュ\<NL>"
        \. "pgw	ぴぇい	ピェイ\<NL>"
        \. "pgz	ぴゃん	ピャン\<NL>"
        \. "ph	ぷう	プウ\<NL>"
        \. "pi	ぴ	ピ\<NL>"
        \. "pj	ぷん	プン\<NL>"
        \. "pk	ぴん	ピン\<NL>"
        \. "pl	ぽん	ポン\<NL>"
        \. "pn	ぱん	パン\<NL>"
        \. "po	ぽ	ポ\<NL>"
        \. "pp	ぽう	ポウ\<NL>"
        \. "pq	ぱい	パイ\<NL>"
        \. "pu	ぷ	プ\<NL>"
        \. "pv	ぽう	ポウ\<NL>"
        \. "pw	ぺい	ペイ\<NL>"
        \. "pya	ぴゃ	ピャ\<NL>"
        \. "pyd	ぴぇん	ピェン\<NL>"
        \. "pye	ぴぇ	ピェ\<NL>"
        \. "pyh	ぴゅう	ピュウ\<NL>"
        \. "pyi	ぴぃ	ピィ\<NL>"
        \. "pyj	ぴゅん	ピュン\<NL>"
        \. "pyl	ぴょん	ピョン\<NL>"
        \. "pyn	ぴゃん	ピャン\<NL>"
        \. "pyo	ぴょ	ピョ\<NL>"
        \. "pyp	ぴょう	ピョウ\<NL>"
        \. "pyq	ぴゃい	ピャイ\<NL>"
        \. "pyu	ぴゅ	ピュ\<NL>"
        \. "pyw	ぴぇい	ピェイ\<NL>"
        \. "pyz	ぴゃん	ピャン\<NL>"
        \. "pz	ぱん	パン\<NL>"
        \. "ra	ら	ラ\<NL>"
        \. "rd	れん	レン\<NL>"
        \. "re	れ	レ\<NL>"
        \. "rh	るう	ルウ\<NL>"
        \. "ri	り	リ\<NL>"
        \. "rj	るん	ルン\<NL>"
        \. "rk	りん	リン\<NL>"
        \. "rl	ろん	ロン\<NL>"
        \. "rn	らん	ラン\<NL>"
        \. "ro	ろ	ロ\<NL>"
        \. "rp	ろう	ロウ\<NL>"
        \. "rq	らい	ライ\<NL>"
        \. "rr	られ	ラレ\<NL>"
        \. "ru	る	ル\<NL>"
        \. "rw	れい	レイ\<NL>"
        \. "rya	りゃ	リャ\<NL>"
        \. "ryd	りぇん	リェン\<NL>"
        \. "rye	りぇ	リェ\<NL>"
        \. "ryh	りゅう	リュウ\<NL>"
        \. "ryi	りぃ	リィ\<NL>"
        \. "ryj	りゅん	リュン\<NL>"
        \. "ryk	りょく	リョク\<NL>"
        \. "ryl	りょん	リョン\<NL>"
        \. "ryn	りゃん	リャン\<NL>"
        \. "ryo	りょ	リョ\<NL>"
        \. "ryp	りょう	リョウ\<NL>"
        \. "ryq	りゃい	リャイ\<NL>"
        \. "ryu	りゅ	リュ\<NL>"
        \. "ryw	りぇい	リェイ\<NL>"
        \. "ryz	りゃん	リャン\<NL>"
        \. "rz	らん	ラン\<NL>"
        \. "sa	さ	サ\<NL>"
        \. "sd	せん	セン\<NL>"
        \. "se	せ	セ\<NL>"
        \. "sf	さい	サイ\<NL>"
        \. "sh	すう	スウ\<NL>"
        \. "si	し	シ\<NL>"
        \. "sj	すん	スン\<NL>"
        \. "sk	しん	シン\<NL>"
        \. "sl	そん	ソン\<NL>"
        \. "sm	しも	シモ\<NL>"
        \. "sn	さん	サン\<NL>"
        \. "so	そ	ソ\<NL>"
        \. "sp	そう	ソウ\<NL>"
        \. "sq	さい	サイ\<NL>"
        \. "sr	する	スル\<NL>"
        \. "ss	せい	セイ\<NL>"
        \. "st	した	シタ\<NL>"
        \. "su	す	ス\<NL>"
        \. "sv	さい	サイ\<NL>"
        \. "sw	せい	セイ\<NL>"
        \. "sya	しゃ	シャ\<NL>"
        \. "syd	しぇん	シェン\<NL>"
        \. "sye	しぇ	シェ\<NL>"
        \. "syh	しゅう	シュウ\<NL>"
        \. "syi	しぃ	シィ\<NL>"
        \. "syj	しゅん	シュン\<NL>"
        \. "syl	しょん	ション\<NL>"
        \. "syo	しょ	ショ\<NL>"
        \. "syp	しょう	ショウ\<NL>"
        \. "syq	しゃい	シャイ\<NL>"
        \. "syu	しゅ	シュ\<NL>"
        \. "syw	しぇい	シェイ\<NL>"
        \. "syz	しゃん	シャン\<NL>"
        \. "sz	さん	サン\<NL>"
        \. "tU	っ	ッ\<NL>"
        \. "ta	た	タ\<NL>"
        \. "tb	たび	タビ\<NL>"
        \. "td	てん	テン\<NL>"
        \. "te	て	テ\<NL>"
        \. "tgh	てゅ	テュー\<NL>"
        \. "tgi	てぃ	ティ\<NL>"
        \. "tgk	てぃん	ティン\<NL>"
        \. "tgp	とぅ	トゥー\<NL>"
        \. "tgu	てゅ	テュ\<NL>"
        \. "th	つう	ツウ\<NL>"
        \. "ti	ち	チ\<NL>"
        \. "tj	つん	ツン\<NL>"
        \. "tk	ちん	チン\<NL>"
        \. "tl	とん	トン\<NL>"
        \. "tm	ため	タメ\<NL>"
        \. "tn	たん	タン\<NL>"
        \. "to	と	ト\<NL>"
        \. "tp	とう	トウ\<NL>"
        \. "tq	たい	タイ\<NL>"
        \. "tr	たら	タラ\<NL>"
        \. "tsU	っ	ッ\<NL>"
        \. "tsa	つぁ	ツァ\<NL>"
        \. "tse	つぇ	ツェ\<NL>"
        \. "tsi	つぃ	ツィ\<NL>"
        \. "tso	つぉ	ツォ\<NL>"
        \. "tsu	つ	ツ\<NL>"
        \. "tt	たち	タチ\<NL>"
        \. "tu	つ	ツ\<NL>"
        \. "tw	てい	テイ\<NL>"
        \. "tya	ちゃ	チャ\<NL>"
        \. "tyd	ちぇん	チェン\<NL>"
        \. "tye	ちぇ	チェ\<NL>"
        \. "tyh	ちゅう	チュウ\<NL>"
        \. "tyi	ちぃ	チィ\<NL>"
        \. "tyj	ちゅん	チュン\<NL>"
        \. "tyl	ちょん	チョン\<NL>"
        \. "tyn	ちゃん	チャン\<NL>"
        \. "tyo	ちょ	チョ\<NL>"
        \. "typ	ちょう	チョウ\<NL>"
        \. "tyq	ちゃい	チャイ\<NL>"
        \. "tyu	ちゅ	チュ\<NL>"
        \. "tyw	ちぇい	チェイ\<NL>"
        \. "tyz	ちゃん	チャン\<NL>"
        \. "tz	たん	タン\<NL>"
        \. "u	う	ウ\<NL>"
        \. "va	う゛ぁ	ヴァ\<NL>"
        \. "vd	う	ヴェン\<NL>"
        \. "ve	う゛ぇ	ヴェ\<NL>"
        \. "vi	う゛ぃ	ヴィ\<NL>"
        \. "vk	う	ヴィン\<NL>"
        \. "vl	う	ヴォン\<NL>"
        \. "vn	う	ヴァン\<NL>"
        \. "vo	う゛ぉ	ヴォ\<NL>"
        \. "vp	う	ヴォー\<NL>"
        \. "vq	う	ヴァイ\<NL>"
        \. "vu	う゛	ヴ\<NL>"
        \. "vw	う	ヴェイ\<NL>"
        \. "vya	う	ヴャ\<NL>"
        \. "vye	う	ヴェ\<NL>"
        \. "vyo	う	ヴョ\<NL>"
        \. "vyu	う	ヴュ\<NL>"
        \. "vz	う	ヴァン\<NL>"
        \. "wA	ゎ	ヮ\<NL>"
        \. "wa	わ	ワ\<NL>"
        \. "wd	うぇん	ウェン\<NL>"
        \. "we	うぇ	ウェ\<NL>"
        \. "wf	わ	ワ\<NL>"
        \. "wha	うぁ	ウァ\<NL>"
        \. "whe	うぇ	ウェ\<NL>"
        \. "whi	うぃ	ウィ\<NL>"
        \. "who	うぉ	ウォ\<NL>"
        \. "whu	う	ウ\<NL>"
        \. "wi	うぃ	ウィ\<NL>"
        \. "wk	うぃん	ウィン\<NL>"
        \. "wl	うぉん	ウォン\<NL>"
        \. "wn	わん	ワン\<NL>"
        \. "wo	を	ヲ\<NL>"
        \. "wp	うぉ	ウォー\<NL>"
        \. "wq	わい	ワイ\<NL>"
        \. "wr	われ	ワレ\<NL>"
        \. "wso	うぉ	ウォ\<NL>"
        \. "wt	わた	ワタ\<NL>"
        \. "wu	う	ウ\<NL>"
        \. "wz	わん	ワン\<NL>"
        \. "xa	しゃ	シャ\<NL>"
        \. "xc	しゃ	シャ\<NL>"
        \. "xd	しぇん	シェン\<NL>"
        \. "xe	しぇ	シェ\<NL>"
        \. "xf	しぇい	シェイ\<NL>"
        \. "xh	しゅう	シュウ\<NL>"
        \. "xi	し	シ\<NL>"
        \. "xj	しゅん	シュン\<NL>"
        \. "xk	しん	シン\<NL>"
        \. "xka	ヵ	ヵ\<NL>"
        \. "xke	ヶ	ヶ\<NL>"
        \. "xl	しょん	ション\<NL>"
        \. "xn	しゃん	シャン\<NL>"
        \. "xo	しょ	ショ\<NL>"
        \. "xp	しょう	ショウ\<NL>"
        \. "xq	しゃい	シャイ\<NL>"
        \. "xt	しゅつ	シュツ\<NL>"
        \. "xtsu	っ	ッ\<NL>"
        \. "xtu	っ	ッ\<NL>"
        \. "xu	しゅ	シュ\<NL>"
        \. "xv	しゃい	シャイ\<NL>"
        \. "xw	しぇい	シェイ\<NL>"
        \. "xwa	ゎ	ヮ\<NL>"
        \. "xwe	ゑ	ヱ\<NL>"
        \. "xwi	ゐ	ヰ\<NL>"
        \. "xxa	ぁ	ァ\<NL>"
        \. "xxe	ぇ	ェ\<NL>"
        \. "xxi	ぃ	ィ\<NL>"
        \. "xxo	ぉ	ォ\<NL>"
        \. "xxu	ぅ	ゥ\<NL>"
        \. "xya	ゃ	ャ\<NL>"
        \. "xyo	ょ	ョ\<NL>"
        \. "xyu	ゅ	ュ\<NL>"
        \. "xz	しゃん	シャン\<NL>"
        \. "ya	や	ヤ\<NL>"
        \. "ye	いぇ	イェ\<NL>"
        \. "yh	ゆう	ユウ\<NL>"
        \. "yi	い	イ\<NL>"
        \. "yi	ゐ	ヰ\<NL>"
        \. "yj	ゆん	ユン\<NL>"
        \. "yl	よん	ヨン\<NL>"
        \. "yn	やん	ヤン\<NL>"
        \. "yo	よ	ヨ\<NL>"
        \. "yp	よう	ヨウ\<NL>"
        \. "yq	やい	ヤイ\<NL>"
        \. "yr	よる	ヨル\<NL>"
        \. "yu	ゆ	ユ\<NL>"
        \. "yv	ゆう	ユウ\<NL>"
        \. "yz	やん	ヤン\<NL>"
        \. "z,	‥\<NL>"
        \. "z-	〜\<NL>"
        \. "z.	…\<NL>"
        \. "z/	・\<NL>"
        \. "z[	『\<NL>"
        \. "z]	』\<NL>"
        \. "za	ざ	ザ\<NL>"
        \. "zc	ざ	ザ\<NL>"
        \. "zd	ぜん	ゼン\<NL>"
        \. "ze	ぜ	ゼ\<NL>"
        \. "zf	ぜ	ゼ\<NL>"
        \. "zh	←\<NL>"
        \. "zh	ずう	ズウ\<NL>"
        \. "zi	じ	ジ\<NL>"
        \. "zj	↓\<NL>"
        \. "zj	ずん	ズン\<NL>"
        \. "zk	↑\<NL>"
        \. "zk	じん	ジン\<NL>"
        \. "zl	→\<NL>"
        \. "zl	ぞん	ゾン\<NL>"
        \. "zn	ざん	ザン\<NL>"
        \. "zo	ぞ	ゾ\<NL>"
        \. "zp	ぞう	ゾウ\<NL>"
        \. "zq	ざい	ザイ\<NL>"
        \. "zr	ざる	ザル\<NL>"
        \. "zu	ず	ズ\<NL>"
        \. "zv	ざい	ザイ\<NL>"
        \. "zw	ぜい	ゼイ\<NL>"
        \. "zx	ぜい	ゼイ\<NL>"
        \. "zya	じゃ	ジャ\<NL>"
        \. "zyd	じぇん	ジェン\<NL>"
        \. "zye	じぇ	ジェ\<NL>"
        \. "zyh	じゅう	ジュウ\<NL>"
        \. "zyi	じぃ	ジィ\<NL>"
        \. "zyj	じゅん	ジュン\<NL>"
        \. "zyl	じょん	ジョン\<NL>"
        \. "zyn	じゃん	ジャン\<NL>"
        \. "zyo	じょ	ジョ\<NL>"
        \. "zyp	じょう	ジョウ\<NL>"
        \. "zyq	じゃい	ジャイ\<NL>"
        \. "zyu	じゅ	ジュ\<NL>"
        \. "zyw	じぇい	ジェイ\<NL>"
        \. "zyz	じゃん	ジャン\<NL>"
        \. "zz	ざん	ザン\<NL>"
        \. "-	ー\<NL>"
        \. ":	：\<NL>"
        \. "[	「\<NL>"
        \. "]	」\<NL>"
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
  nnoremap <silent> [unite], :<C-u>Unite -buffer-name=all buffer file_mru bookmark file file/new directory/new<CR>
  nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=buffers buffer<CR>
  nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=command command<CR>
  nnoremap <silent> [unite]d :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file file/new directory/new<CR>
  nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_mru file_rec file/new directory/new<CR>
  nnoremap <silent> [unite]g :<C-u>UniteWithBufferDir -buffer-name=grep grep<CR>
  nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>
  nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
  nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=source source<CR>
  nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline outline<CR>
  nnoremap <silent> [unite]A :<C-u>UniteBookmarkAdd<CR>
  nnoremap <silent> [unite]B :<C-u>Unite -buffer-name=bookmark bookmark<CR>
  nnoremap <silent> [unite]C :<C-u>Unite -buffer-name=history/command history/command<CR>
  nnoremap <silent> [unite]D :<C-u>UniteWithBufferDir -buffer-name=files file_rec<CR>
  nnoremap <silent> [unite]H :<C-u>UniteWithCursorWord -buffer-name=helps tag help<CR>

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

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

autocmd MyAutoCmd BufRead, BufEnter *.contract setf ruby

filetype plugin indent on
syntax enable
