set nocompatible

call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Shougo's plugins
Plug 'Shougo/neobundle.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make'}

" Tim Pope's plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Scrooloose's plugins
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'

" Mattn's plugins
Plug 'mattn/gist-vim'

" Snippets
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer --racer-completer --tern-completer' }
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Other plugins
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'Chiel92/vim-autoformat'
Plug 'bronson/vim-trailing-whitespace'
Plug 'chilicuil/vim-sprunge'
Plug 'vim-utils/vim-man'
Plug 'mtth/scratch.vim'

" Required:
filetype plugin indent on

call plug#end()

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"


" Custom:

" Keymaps:

" Map comma as leader
let mapleader = ","

" Map ,af to autoformat code
noremap <leader>af :Autoformat<CR>

" Map <leader>rt to refresh the ctags file
noremap <leader>rt :!ctags -R<CR>

" Map <leader>fw to fix trailing spaces
noremap <leader>fw :FixWhitespace<CR>

" Map <leader>cs to fast colorscheme changing
noremap <leader>sc :colorscheme<space>

" Map <leader>ve to Vdebug evaluation command
noremap <leader>ve :VdebugEval<space>

" Map <leader>w to Ctrl+W for easier pane management
noremap <leader>w <C-w>

" Map <leader>b to Breakpoint creation command
noremap <leader>b :Breakpoint<CR>

" Toggle NERDTree on <leader>t
noremap <leader>t :NERDTreeToggle<CR>

" Suspend to shell
noremap <leader>z <C-z>

" VimShell
noremap <leader>vs :VimShell<CR>


" Pane resizing mapings
" Taller
noremap <leader>w. :res+5<CR>

" Shorter
noremap <leader>w, :res-5<CR>

" Wider
noremap <leader>w> :vertical res +5<CR>

" Narrower
noremap <leader>w< :vertical res -5<CR>"

" Set ultisnips shortcuts
let g:UltiSnipsExpandTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-tab>"


" Miscellanous:

" Syntax highlighting
syntax on

" Syntax highlighting theme:
colorscheme Tomorrow-Night

" Always show line number
set number

" Always show tabline
set laststatus=2

" Color scheme required by airline
set t_Co=256

" set tab to 4 literal spaces
set tabstop=4 shiftwidth=4 expandtab

" Fix asterisk placement for C
let g:formatters_c = ['astyle_c']

if !exists('g:formatdef_astyle_c')
    let g:formatdef_astyle_c = '"astyle --mode=c --style=kr -k3 -pcH".(&expandtab ? "s".shiftwidth() : "t")'
endif

" Set a folding method
set foldmethod=syntax

" Give YouCompleteMe access to python3
let g:ycm_server_python_interpreter = '/usr/bin/python3'

" Set a global cflags file for YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

" Configure the colorcolumn
set textwidth=80
set colorcolumn=+1
