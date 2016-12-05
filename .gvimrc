" FullScreen
if has('kaoriya')
  au GUIEnter * SM 5
  if has('win32')
    au GUIEnter * simalt ~x " :help gui-win32-maximized
  endif
else
  set guioptions=
endif

" Commandline Height
set cmdheight=1

" Font
if has('win32')
  set guifont=Myrica_M:h15
elseif has('mac')
  set guifont=源ノ角ゴシック\ Code\ JP\ N:h16
endif

" http://kaworu.jpn.org/kaworu/2013-05-08-1.php
if has('kaoriya')
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ja_jp.utf-8
  source $VIMRUNTIME/menu.vim
endif

" カーソル行のカラーを設定
highlight CursorLine guibg=#262626

" 入力モード時、ステータスラインのカラーを変更
augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" [DirectWriteを用いてVimのフォント描画を改善する](http://www.kaoriya.net/blog/2013/05/05/)
set rop=type:directx

