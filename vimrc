set nocompatible

call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Shougo's plugins
Plug 'Shougo/neobundle.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet-snippets'

" Tim Pope's plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'

" Scrooloose's plugins
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'

" Mattn's plugins
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Other plugins
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'Chiel92/vim-autoformat'
Plug 'bronson/vim-trailing-whitespace'
Plug 'chilicuil/vim-sprunge'
Plug 'vim-utils/vim-man'
Plug 'mtth/scratch.vim'
Plug 'brookhong/cscope.vim'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'
Plug 'yegappan/mru'

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
noremap <leader>af :Autoformat<enter>

" Map <leader>rt to refresh the ctags file
noremap <leader>rt :!ctags -R<enter>

" Map <leader>fw to fix trailing spaces
noremap <leader>fw :FixWhitespace<enter>

" Map <leader>cs to fast colorscheme changing
noremap <leader>sc :colorscheme<space>

" Map <leader>w to Ctrl+W for easier pane management
noremap <leader>w <C-w>

" Map <leader>b to Breakpoint creation command
noremap <leader>b :Breakpoint<enter>

" Insert space under cursor
noremap <leader><space> i<space><esc>

" Insert empty line above/below cursor
noremap <leader>o o<esc>
noremap <leader>O O<esc>

" Toggle NERDTree on <leader>t
noremap <leader>t :NERDTreeToggle<enter>

" Suspend to shell
noremap <leader>z <C-z>

" VimShell
noremap <leader>vs :VimShell<enter>


" Pane resizing mapings
" Taller
noremap <leader>w. :res+5<enter>

" Shorter
noremap <leader>w, :res-5<enter>

" Wider
noremap <leader>w> :vertical res +5<enter>

" Narrower
noremap <leader>w< :vertical res -5<enter>"

" Close everything
noremap <leader>wa :qa<enter>

" Set ultisnips shortcuts
let g:UltiSnipsExpandTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-tab>"

" Cscope maps
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<enter>
nnoremap <leader>l :call ToggleLocationList()<enter>

" Session management maps
nnoremap <leader>xs :SaveSession<space>
nnoremap <leader>xo :OpenSession<space>
nnoremap <leader>xd :DeleteSession<space>
nnoremap <leader>xc :CloseSession<space>
nnoremap <leader>xv :ViewSession<space>

" Taglist map
nnoremap <leader>e :TlistToggle<enter>

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
" set tabstop=4 shiftwidth=4 expandtab

" Fix asterisk placement for C
let g:formatters_c = ['astyle_c']

if !exists('g:formatdef_astyle_c')
    let g:formatdef_astyle_c = '"astyle --mode=c --style=kr -k3 -pcH".(&expandtab ? "s".shiftwidth() : "t")'
endif

" Set a folding method
set foldmethod=syntax

" Configure the colorcolumn
set textwidth=80
set colorcolumn=+1

if has('gui_running')

    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 8
endif

" Don't save sessions by default
let g:session_autosave = 'no'

let g:neocomplete#enable_at_startup = 1
