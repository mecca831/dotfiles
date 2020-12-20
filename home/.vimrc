" for vundle 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'molokai'
Plugin 'vimwiki'
Plugin 'The-NERD-tree'
"Plugin 'snipMate'
Plugin 'YankRing.vim'
Plugin 'surround.vim'
Plugin 'EnhCommentify.vim'
Plugin 'fugitive.vim'
Plugin 'mru.vim'
Plugin 'taglist.vim'
Plugin 'Solarized'
Plugin 'https://github.com/w0ng/vim-hybrid.git'
Plugin 'ctrlp.vim'
Plugin 'groovyindent'
Plugin 'bling/vim-airline'
Plugin 'rainbow_parentheses.vim'
Plugin 'Indent-Guides'
Plugin 'rking/ag.vim'
Plugin 'git-time-lapse'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'honza/vim-snippets'
Plugin 'blp1526/storage.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'neocomplcache'
Plugin 'delimitMate.vim'
Plugin 'SirVer/ultisnips'
call vundle#end()

set langmenu=none
let $LANG="zh_TW.UTF-8" " locales
set encoding=utf-8      " ability
set fileencoding=utf-8  " prefer
" charset detect list. ucs-bom must be earlier than ucs*.
set fileencodings=ascii,ucs-bom,utf-8,taiwan,chinese,latin1

" for console mode we use big5
if has("gui_running")
    if has("gui_macvim")
"        set guifont=DejaVu\ Sans\ Mono:h15
        set guifont=Ubuntu\ Mono:h20
        set imd
        set fuopt+=maxhorz
        "colorscheme murphy
        colorscheme molokai
    else
"        set guifont=Osaka-Mono:h20
"        highlight Normal guibg=Black guifg=White
"        highlight Cursor guibg=Orange guifg=NONE
"        highlight lCursor guibg=Orange guifg=NONE
"        highlight NonText guibg=Black
"        highlight Constant gui=NONE guibg=grey20
"        highlight Special gui=NONE guibg=grey20
        set guifont=Ubuntu\ Mono\ 13
        colorscheme molokai
    endif
    set termencoding=utf-8
    set lines=40 columns=100
"    win 100 40
"    winp 50 50
else
    set termencoding=big5
endif

"source $VIMRUNTIME/vimrc_example.vim
"colorscheme bayQua

set nocompatible
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set ignorecase
set smartcase

set backspace=indent,eol,start
set whichwrap=<,>

set history=50  " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching
set hlsearch
set clipboard=unnamed
syntax enable

set laststatus=2
set undodir=/tmp
set udf

map <leader>v <Plug>VimwikiToggleListItem
nmap tn :tabnew<cr>
nmap tc :tabclose<cr>
nmap <Leader>o :NERDTreeToggle<cr>
nmap <Leader>j :%!python -m json.tool<cr>
map <leader>gt :call TimeLapse() <cr>

filetype plugin indent on

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:ctrlp_map = '<leader>p'
let g:neocomplcache_enable_at_startup = 1
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_clear_cache_on_exit = 0
