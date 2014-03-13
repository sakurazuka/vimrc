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

NeoBundle 'https://github.com/mhinz/vim-startify.git'

if neobundle#exists_not_installed_bundles()
echomsg 'Not installed bundles : ' .
\ string(neobundle#get_not_installed_bundle_names())
echomsg 'Install Plugins'
NeoBundleInstall
endif

filetype plugin indent on
