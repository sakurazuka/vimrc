if has('gui_macvim')

  " MacVimの設定
  set nocompatible
  filetype off

  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'

  " 導入したいプラグインを以下に列挙
  " Plugin '[Github Author]/[Github repo]' の形式で記入
  Plugin 'kannokanno/previm'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'dhruvasagar/vim-table-mode'

  call vundle#end()
  filetype plugin indent on

  "　その他のカスタム設定を以下に書く
  let g:previm_open_cmd = 'open -a "Google Chrome"'
  augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  augroup END
  " }}}
  let g:vim_markdown_conceal = 0
  let g:table_mode_corner = '|'
  let g:vim_markdown_folding_disabled = 1

else

  " コマンドラインのVimの設定
  syntax on
  set bs=start,indent,eol
  set laststatus=2
  set number
  set noswapfile
  set cursorline
  set cursorcolumn
  set hlsearch
  set autoindent
  set smartindent

  augroup vimrc-filetype
    autocmd!
    " PHPだったらインデント幅が４で
    autocmd FileType php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

    " Rubyだったらインデント幅は2にしたい
    autocmd FileType ruby setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType eruby setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
  augroup END

  " color
  " colorscheme railscasts

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

  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'

  " 導入したいプラグインを以下に列挙
  " Plugin '[Github Author]/[Github repo]' の形式で記入
  " Plugin 'kannokanno/previm'

  " railscasts カラースキーム
  Plugin 'jpo/vim-railscasts-theme'

  " unite
  Plugin 'Shougo/unite.vim'
  Plugin 'Shougo/neomru.vim'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'Shougo/unite-outline'
  Plugin 'hewes/unite-gtags'
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
  " outline
  nnoremap <silent> ,uo :<C-u>Unite outline<CR>
  " カーソル下の呼び出し元一覧を出力
  nnoremap <silent> ,tr  :<C-u>Unite gtags/ref:<CR>
  " カーソル下の定義元を出力
  nnoremap <silent> ,td  :<C-u>Unite gtags/def:<CR>
  " タグファイル内grep
  nnoremap <silent> ,tg  :<C-u>Unite gtags/grep:<CR>
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

  " Rails
  Plugin 'tpope/vim-rails'
  Plugin 'basyura/unite-rails'
  nnoremap <C-x> :Unite rails/
  Plugin 'tpope/vim-endwise'

  " ruby-refactoring
  Plugin 'ecomba/vim-ruby-refactoring'
  " メソッドに引数を追加する
  :nnoremap <leader>rap  :RAddParameter<cr>
  " 一行で書かれた条件文(e.g. "hoge if fuga?" のようなもの)を伝統的な複数行の形式に変換する
  :nnoremap <leader>rcpc :RConvertPostConditional<cr>
  " 選択部分を RSpec の "let(:hoge) { fuga }" の形式に切り出す
  :nnoremap <leader>rel  :RExtractLet<cr>
  " 選択部分を定数として切り出す
  :vnoremap <leader>rec  :RExtractConstant<cr>
  " 選択部分を変数として切り出す
  :vnoremap <leader>relv :RExtractLocalVariable<cr>
  " 一時変数を取り除く
  :nnoremap <leader>rit  :RInlineTemp<cr>
  " ローカル変数をリネームする
  :vnoremap <leader>rrlv :RRenameLocalVariable<cr>
  " インスタンス変数をリネームする
  :vnoremap <leader>rriv :RRenameInstanceVariable<cr>
  " 選択部分をメソッドに切り出す
  :vnoremap <leader>rem  :RExtractMethod<cr>

  " html5
  Plugin 'othree/html5.vim'
  let g:html5_event_handler_attributes_complete = 1
  let g:html5_rdfa_attributes_complete = 1
  let g:html5_microdata_attributes_complete = 1
  let g:html5_aria_attributes_complete = 1

  " solidity
  Plugin 'tomlion/vim-solidity'

  " javascript
  Plugin 'prettier/vim-prettier'
  Plugin 'pangloss/vim-javascript'

  " VueJS
  Plugin 'posva/vim-vue'

  " coffee script
  Plugin 'kchmck/vim-coffee-script'
  au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
  nnoremap <silent> ,cs  :<C-u>CoffeeCompile vert <CR><C-w>h

  " TypeScript
  Plugin 'Quramy/tsuquyomi'
  Plugin 'leafgarland/typescript-vim'

  " git
  Plugin 'tpope/vim-fugitive'
  Plugin 'gregsexton/gitv'

  " カーソル移動系
  Plugin 'matze/vim-move'
  let g:move_key_modifier = 'C'
  Plugin 'Lokaltog/vim-easymotion'
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
  Plugin 'rhysd/clever-f.vim'

  " 文字選択系
  Plugin 'gcmt/wildfire.vim'
  let g:wildfire_water_map = '<S-Enter>'
  let g:wildfire_objects = ["i'", 'i"', 'i)', 'i]', 'i}', 'ip', 'it', 'i>']
  Plugin 'tpope/vim-surround'

  " コメントアウト
  Plugin 'scrooloose/nerdcommenter'
  let NERDSpaceDelims = 1
  nmap ,, <Plug>NERDCommenterToggle
  vmap ,, <Plug>NERDCommenterToggle

 " クリップボード
  Plugin 'kana/vim-fakeclip'

  " ステータスライン
  Plugin 'itchyny/lightline.vim'
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

  if !exists('loaded_matchit')
    " matchitを有効化
    runtime macros/matchit.vim
  endif

  call vundle#end()
  filetype plugin indent on

endif
