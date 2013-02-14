" 入力モードで開始する
" let g:unite_enable_start_insert=1

" ESCキーを2回押すと終了する
nnoremap <silent> <buffer> <ESC><ESC> q
inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" Unite bookmarkで開くときのアクションのデフォルトをVimfilerに変更
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
