"       _                _        _  _     
"    __| |  __ _  _ __  (_)  ___ | |( )___ 
"   / _` | / _` || '_ \ | | / _ \| ||// __|
"  | (_| || (_| || | | || ||  __/| |  \__ \
"   \__,_| \__,_||_| |_||_| \___||_|  |___/
"          _                               
"  __   __(_) _ __ ___   _ __  ___         
"  \ \ / /| || '_ ` _ \ | '__|/ __|        
"   \ V / | || | | | | || |  | (__         
"    \_/  |_||_| |_| |_||_|   \___|        
"                                          
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set pathogen.vim up and running
execute pathogen#infect()
syntax on
filetype plugin indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Enable line numbers in NERDTree
"let NERDTreeShowLineNumbers=1

set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set backupdir=~/vimBackups/
set directory=~/vimBackups/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable line numbers
set number

" Highlight search results
set hlsearch

" Show 'invisible' characters
set lcs=tab:\ \ ,trail:·,nbsp:_
set list

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Open NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree

" Map specific key or shortcut to open NERDTree
map <Leader>n :NERDTreeToggle<CR>

" resize vim splits
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme evening
set background=dark

" Display vim colors properly on ubuntu
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE '
  en
  return ''
endfunction

function! CommitMessages()
    let g:git_ci_msg_user = substitute(system("git config --get user.name"), '\n$', '', '')
    let g:git_ci_msg_email = substitute(system("git config --get user.email"), '\n$', '', '')

    nmap S oSigned-off-by: <C-R>=printf("%s <%s>", g:git_ci_msg_user, g:git_ci_msg_email)<CR><CR><ESC>
    nmap R oReviewed-by: <C-R>=printf("%s <%s>", g:git_ci_msg_user, g:git_ci_msg_email)<CR><ESC>
    iab #S Signed-off-by: <C-R>=printf("%s <%s>", g:git_ci_msg_user, g:git_ci_msg_email)<CR>
    iab #R Reviewed-by: <C-R>=printf("%s <%s>", g:git_ci_msg_user, g:git_ci_msg_email)<CR>
    iab #O Signed-off-by:
    iab #V Reviewed-by:
    iab #P Pair-Programmed-With:
    iab ME <C-R>=printf("%s <%s>", g:git_ci_msg_user, g:git_ci_msg_email)<CR>
    iab ASN Andreas<SPACE>Schnitzel<SPACE><asn@google.org>
endf
autocmd BufWinEnter COMMIT_EDITMSG,*.diff,*.patch,*.patches.txt call CommitMessages()
