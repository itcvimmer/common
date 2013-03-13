"= NeoBundle一覧

"-----------------------------------------------------------------------------
" プラグイン
"-----------------------------------------------------------------------------
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

let g:neobundle_default_git_protocol = 'http'

" 基本プラグイン
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimproc.git', {
      \ 'build' : {
      \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'tsukkee/unite-tag.git'
NeoBundle 'tsukkee/unite-help.git'
NeoBundle 'thinca/vim-unite-history.git'
NeoBundle 'h1mesuke/unite-outline.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'thinca/vim-ref.git'
NeoBundle 'thinca/vim-openbuf.git'
NeoBundle 'yuroyoro/vimdoc_ja.git'
NeoBundle 'Lokaltog/vim-powerline.git'
NeoBundle 'banyan/recognize_charcode.vim'
NeoBundle 'vim-scripts/smartword.git'
NeoBundle 'vim-scripts/camelcasemotion.git'
NeoBundle 'vim-scripts/grep.vim.git'
NeoBundle 'vim-scripts/eregex.vim.git'
NeoBundle 'tyru/open-browser.vim.git'
NeoBundle 'thinca/vim-visualstar.git'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'kana/vim-fakeclip.git'
NeoBundle 'vim-scripts/sudo.vim.git'
NeoBundle 'c9s/cascading.vim.git'
NeoBundle 'vim-scripts/DirDiff.vim.git'
NeoBundle 'vim-scripts/DirDo.vim'
NeoBundle 'nathanaelkane/vim-indent-guides.git'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'h1mesuke/vim-alignta.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'taku-o/vim-toggle.git'
NeoBundle 'vim-scripts/jade.vim.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'kana/vim-textobj-user.git'
NeoBundle 'kana/vim-textobj-syntax.git'
NeoBundle 'kana/vim-textobj-lastpat.git'
NeoBundle 'kana/vim-textobj-indent.git'
NeoBundle 'kana/vim-textobj-function.git'
NeoBundle 'kana/vim-textobj-fold.git'
NeoBundle 'thinca/vim-textobj-plugins.git'
NeoBundle 'vim-scripts/textobj-entire.git'
NeoBundle 'vim-scripts/textobj-jabraces.git'
NeoBundle 'vim-scripts/operator-user.git'
NeoBundle 'vim-scripts/operator-camelize.git'
NeoBundle 'vim-scripts/operator-replace.git'
NeoBundle 'motemen/git-vim.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'vim-scripts/vcscommand.vim.git'
NeoBundle 'vim-scripts/taglist.vim.git'
NeoBundle 'vim-scripts/Source-Explorer-srcexpl.vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'yuroyoro/vim-autoclose.git'
NeoBundle 'yuroyoro/yuroyoro256.vim'
NeoBundle 'mattn/webapi-vim.git'
NeoBundle 'mattn/excitetranslate-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'vim-scripts/matchit.zip.git'

" 開発系プラグイン
NeoBundle 'rhysd/vim-textobj-ruby.git'
NeoBundle 'vim-scripts/jQuery.git'
NeoBundle 'groenewege/vim-less.git'
NeoBundle 'vim-scripts/xmledit.git'
NeoBundle 'mattn/zencoding-vim.git'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'kchmck/vim-coffee-script.git'
NeoBundle 'teramako/jscomplete-vim.git'
NeoBundle 'vim-scripts/JavaScript-syntax.git'
NeoBundle 'vim-scripts/ruby-matchit.git'
NeoBundle 'taichouchou2/vim-ref-ri'
NeoBundle 'vim-ruby/vim-ruby.git'
NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'taq/vim-rspec'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails.git'
NeoBundle 'rhysd/unite-ruby-require.vim.git'

syntax enable
filetype plugin indent on

"-----------------------------------------------------------------------------
" Vim本体の設定
"-----------------------------------------------------------------------------
set t_Co=256
set laststatus=2                                  " 常にステータスラインを表示する
set ambiwidth=double                              " vimに全角を解釈させる
set autoread                                      " 外部エディタの変更を自動で読み直す
set hidden                                        " 変更中でも他のファイルを開けるようにする
set backspace=indent,eol,start                    " バックスペースでなんでも消せるように
set formatoptions=lmoq                            " テキスト整形オプション，マルチバイト系を追加
set number                                        " 行番号を表示
set showmatch                                     " 対応する括弧を表示
set nobackup                                      " バックアップをしない
set noswapfile                                    " スワップファイルを作らない
set expandtab                                     " タブの代わりに空白を挿入
set shiftwidth=2                                  " 自動インデントの幅を指定
set tabstop=2
set visualbell t_vb=                              " ビープ音を鳴らさない
set wildmode=longest:list
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex                                  " 印字不可能文字を16進数で表示
set lazyredraw                                    " コマンド実行中は再描画しない
set ttyfast                                       " 高速ターミナル接続を行う
set nocompatible                                  " VI互換なし
set autoindent                                    " 自動でインデント
set smartindent                                   " 新しい行を開始したときのインデントを同じにする
set directory-=.
set smarttab
set textwidth=0                                   " 自動折り返しをしない
set background=light
set clipboard=unnamed
set timeoutlen=1000                               " KeyMapタイムアウト待ち時間
set incsearch                                     " [検索]入力の度に検索する
set nowrapscan                                    " [検索]先頭にループしない
set hlsearch                                      " [検索]文字をハイライトする
set ignorecase                                    " [検索]大文字小文字を区別しない
set smartcase                                     " [検索]大文字を含んでいたら大文字小文字を区別する
set mouse=a
set guioptions+=a
set ttymouse=xterm2
set whichwrap=b,s,h,l,<,>,[,]
set foldenable!
hi Pmenu ctermbg=4
au BufRead,BufNewFile *.snip        set filetype=snippet
au BufRead,BufNewFile *.md          set filetype=markdown
au BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec

"-----------------------------------------------------------------------------
" プラグイン毎の設定
"-----------------------------------------------------------------------------
" yuroyoro256.vim
"
colorscheme yuroyoro256

" ターミナルタイプによるカラー設定
if &term =~ "xterm-256color" || "screen-256color"
  " 256色
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

" QuickRun
"
let g:quickrun_config = {
      \   "_" : {
      \       "runner" : "vimproc",
      \       "runner/vimproc/updatetime" : 60
      \   },
      \}

" neocomplcache
"
let g:neocomplcache_enable_at_startup = 1

" zen-coding
"
let g:user_zen_settings = {'indentation' : '  '}

" vimfiler
"
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer=1

" vimshell
"
let vimshell_prompt = '$ '
let vimshell_user_prompt = '"" . getcwd() . ""'

" Snippet
"
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'

" <TAB>: completion.                                         
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"   
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" tcomment
"
let g:tcommentMapLeader1 = '<C-_>'
let g:tcommentMapLeader2 = '<Leader>'
let g:tcommentMapLeaderOp1 = 'gc'
let g:tcommentMapLeaderOp2 = 'gC'

" tcommentで使用する形式を追加
if !exists('g:tcomment_types')
  let g:tcomment_types = {}
endif
let g:tcomment_types = {
      \'eruby_surround' : "<%% %s %%>",
      \'eruby_surround_minus' : "<%% %s -%%>",
      \'eruby_surround_equality' : "<%%= %s %%>",
\}

" ctags
"
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:SrcExpl_updateTagsCmd = "/usr/local/bin/ctags --sort=foldcase -R ."
if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=0
  set cst
  set nocsverb
  if filereadable("cscope.out")
    cs add cscope.out
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
  set cscopequickfix=s-,c-,d-,i-,t-,e-
endif

" Switch
"
nnoremap + :Switch<CR>e
let g:switch_definitions =
\ [
\   ['true', 'false'],
\   ['if', 'unless'],
\   ['and', 'or'],
\   ['&&', '||'],
\   ['should', 'should_not']
\ ]

"-----------------------------------------------------------------------------
" マッピング
"-----------------------------------------------------------------------------
" カーソル上下移動時に文の折り返しを考慮しない
"
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap k gk
onoremap k gk
xnoremap k gk

" ウィンドウ移動
"
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L

" バッファ移動
"
nnoremap <C-n> :<C-u>bnext<CR>
nnoremap <C-p> :<C-u>bprevious<CR>

" ペースト時にヤンクしない
vnoremap <silent> <C-p> "0p<CR>

" 検索結果のハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>

" ノーマルモードでvvで末尾まで選択
vnoremap v $h

" インサートモードでEmacsライクに移動
"
inoremap <C-a> <Home>
inoremap <C-e> <End>

" ウィンドウ幅調整
"
nnoremap <C-h> <C-w><
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <C-l> <C-w>>

" nnoremap KEY :<C-u>edit $HOME/.vimrc<CR>
" nnoremap KEY :<C-u>edit $HOME/.vimrc.local<CR>
" nnoremap KEY :<C-u>source $HOME/.vimrc<CR>
" nnoremap KEY :<C-u>VCSVimDiff<CR>
" nnoremap KEY :<C-u>VCSDiff<CR>
" nnoremap KEY :<C-u>VCSCommit<CR>
" nnoremap <silent> KEY :<C-u>new<CR>
" nnoremap <silent> KEY :<C-u>vnew<CR>
" nnoremap <silent> KEY :<C-u>split<CR>
" nnoremap <silent> KEY :<C-u>vsplit<CR>
" nnoremap <silent> KEY :<C-u>bd!<CR>
" nnoremap <silent> KEY :<C-u>q!<CR>
" nnoremap <silent> KEY :<C-u>hide<CR>
" nnoremap <silent> KEY :<C-u>set paste!<CR>
" nnoremap <silent> KEY :<C-u>set nu!<CR>
" nnoremap <silent> KEY :<C-u>set readonly!<CR>
" nnoremap <silent> KEY <C-w>f
" nnoremap <silent> KEY <C-w><C-f>
" vnoremap KEY :Alignta<Space>
" nnoremap <silent> KEY :<C-u>VimFilerBufferDir<CR>
" nnoremap <silent> KEY :<C-u>VimFilerBufferDir -split<CR>
" nnoremap <silent> KEY :<C-u>VimFilerExplorer<CR>
" nnoremap <silent> KEY :<C-u>VimShellPop<CR>
" nnoremap <silent> KEY :<C-u>QuickRun<CR>
" nnoremap <silent> KEY :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file file_rec<CR>
" nnoremap <silent> KEY :<C-u>Unite file_rec -start-insert<CR>
" nnoremap <silent> KEY :<C-u>Unite file -start-insert<CR>
" nnoremap <silent> KEY :<C-u>Unite buffer -start-insert<CR>
" nnoremap <silent> KEY :<C-u>Unite tag -start-insert<CR>
" nnoremap <silent> KEY :<C-u>Unite snippet<CR>
" nnoremap KEY :<C-u>Unite rails/
" nnoremap KEY :<C-u>Unite rails/helper -start-insert=1<CR>
" nnoremap KEY :<C-u>Unite rails/model -start-insert=1<CR>
" nnoremap KEY :<C-u>Unite rails/view -start-insert=1<CR>
" nnoremap KEY :<C-u>Unite rails/controller -start-insert=1<CR>
" nnoremap KEY :<C-u>Unite rails/lib -start-insert=1<CR>
" nnoremap KEY :<C-u>Unite rails/spec -start-insert=1<CR>
" nnoremap KEY :<C-u>Unite rails/config -start-insert=1<CR>
" nnoremap KEY :<C-u>Unite rails/rake -start-insert=1<CR>
" nnoremap KEY :<C-u>Unite rails/log -start-insert=1<CR>
" nnoremap KEY :<C-u>set filetype=
" nnoremap KEY :<C-u>set filetype=ruby<CR>
" nnoremap KEY :<C-u>set filetype=ruby.rspec<CR>
" nnoremap KEY :<C-u>set filetype=vim<CR>
" nnoremap KEY :<C-u>set filetype=haskell<CR>
" nnoremap KEY :<C-u>set filetype=html<CR>
" nnoremap KEY :<C-u>set filetype=coffee<CR>
" nnoremap KEY :<C-u>set filetype=javascript<CR>
" nnoremap KEY :<C-u>set filetype=markdown<CR>

source $HOME/.vimrc.local
