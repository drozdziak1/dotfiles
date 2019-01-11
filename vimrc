set nocompatible

call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Shougo's plugins
Plug 'Shougo/neobundle.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc.vim'

" Tim Pope's plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'

" Scrooloose's plugins
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

" Mattn's plugins
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Other plugins
Plug 'Chiel92/vim-autoformat'
Plug 'bronson/vim-trailing-whitespace'
Plug 'brookhong/cscope.vim'
Plug 'cespare/vim-toml'
Plug 'chilicuil/vim-sprunge'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'jlevesy/rust.vim'
Plug 'junegunn/vim-emoji'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'mtth/scratch.vim'
Plug 'pearofducks/ansible-vim'
Plug 'racer-rust/vim-racer'
Plug 'tomlion/vim-solidity'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-utils/vim-man'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'
Plug 'yegappan/mru'
Plug 'w0rp/ale'
Plug 'wilsaj/chuck.vim'

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
noremap <leader>rt :!ctags -R<space>

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
noremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<enter>
noremap <leader>l :call ToggleLocationList()<enter>

" Session management maps
noremap <leader>xs :SaveSession<space>
noremap <leader>xo :OpenSession<space>
noremap <leader>xd :DeleteSession<space>
noremap <leader>xc :CloseSession<space>
noremap <leader>xv :ViewSession<space>

" Taglist map
noremap <leader>e :TlistToggle<enter>

" Undotree map
noremap <leader>mt :UndotreeToggle<enter>:UndotreeFocus<enter>

" MRU map
noremap <leader>mr :MRU<enter>

" Racer mappings
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Miscellanous:

" Syntax highlighting
syntax on

" Syntax highlighting theme:
colorscheme Tomorrow

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

" Choose a formatter for C++
let g:formatters_cpp = ['astyle_cpp']
if !exists('g:formatdef_astyle_cpp')
    let g:formatdef_astyle_cpp = '"astyle --mode=c --style=kr -k3 -pcH".(&expandtab ? "s".shiftwidth() : "t")'
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

" Enable completion rightaway
let g:neocomplete#enable_at_startup = 1

" Jump to the taglist upon opening
let Tlist_GainFocus_On_ToggleOpen = 1

" Enable emoji completion
set completefunc=emoji#complete

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Provide the racer binary
let g:racer_cmd = substitute(system("which racer"), '\n\+$', '', '')

let g:ale_linters = { 'rust': ['rls'], }
