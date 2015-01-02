syntax on
set bs=start,indent,eol
set laststatus=2
set number
set noswapfile
set cursorline
set cursorcolumn
set hlsearch

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" color
colorscheme railscasts

" beep
set visualbell t_vb=
set noerrorbells

" バックアップファイルを作成しない
:set nobackup

" 行末のスペースをハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" 行末の空白を保存時に自動削除
autocmd BufWritePre * :%s/\s\+$//e

set t_Co=256

let mapleader=" "

set clipboard+=unnamed
set clipboard+=autoselect

filetype plugin indent off
if has('vim_starting')
  let bundle_dir = '~/dotfiles/bundle'
  if !isdirectory(bundle_dir.'/neobundle.vim')
    call system( 'git clone https://github.com/Shougo/neobundle.vim.git '.bundle_dir.'/neobundle.vim')
  endif

  exe 'set runtimepath+='.bundle_dir.'/neobundle.vim'
  call neobundle#rc(bundle_dir)
endif

NeoBundle 'https://github.com/tpope/vim-rails.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

NeoBundle 'https://github.com/Shougo/neomru.vim.git'

NeoBundle 'https://github.com/basyura/unite-rails.git'
nnoremap <C-x> :Unite rails/

NeoBundle 'https://github.com/scrooloose/nerdcommenter.git'
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

NeoBundle 'https://github.com/matze/vim-move.git'
let g:move_key_modifier = 'C'

NeoBundle 'https://github.com/Lokaltog/vim-easymotion.git'
" Lokaltog/vim-easymotion
" http://blog.remora.cx/2012/08/vim-easymotion.html
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「;」 + 何かにマッピング
let g:EasyMotion_leader_key=";"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

NeoBundle 'https://github.com/rhysd/clever-f.vim.git'

NeoBundle 'https://github.com/gcmt/wildfire.vim.git'
let g:wildfire_water_map = '<S-Enter>'
let g:wildfire_objects = ["i'", 'i"', 'i)', 'i]', 'i}', 'ip', 'it', 'i>']

NeoBundle 'https://github.com/tpope/vim-surround.git'

NeoBundle 'https://github.com/Shougo/vimproc.vim.git', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
" 自動コンパイル
" http://d.hatena.ne.jp/hirochachacha/20111004/1317715093
" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

NeoBundle 'https://github.com/tpope/vim-fugitive.git'
NeoBundle 'https://github.com/gregsexton/gitv.git'

NeoBundle 'https://github.com/itchyny/lightline.vim.git'
let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }
function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction
function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction
function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction
function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction
function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

NeoBundle 'https://github.com/tpope/vim-endwise.git'

NeoBundle 'https://github.com/kana/vim-fakeclip.git'

if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif

if neobundle#exists_not_installed_bundles()
echomsg 'Not installed bundles : ' .
\ string(neobundle#get_not_installed_bundle_names())
echomsg 'Install Plugins'
NeoBundleInstall
endif

filetype plugin indent on
