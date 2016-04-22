" NeoBundle Scripts-----------------------------
if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


" Add or remove your Bundles here:

" Shougo's plugins
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }

" Tim Pope's plugins
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'

" Scrooloose's plugins
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'

" Mattn's plugins
NeoBundle 'mattn/gist-vim'

" Other plugins
NeoBundle 'honza/vim-snippets'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'chilicuil/vim-sprunge'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" neosnippet.vim

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'


" Custom:

" Map comma as leader
let mapleader = ","

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

" Toggle NERDTree on <leader>t
noremap <leader>t :NERDTreeToggle<CR>

" set tab to 4 literal spaces
set tabstop=4 shiftwidth=4 expandtab

" Enable neocomplete plugin
let g:neocomplete#enable_at_startup = 1

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

" Fix asterisk placement for C
let g:formatters_c = ['astyle_c']

if !exists('g:formatdef_astyle_c')
    let g:formatdef_astyle_c = '"astyle --mode=c --style=kr -k3 -pcH".(&expandtab ? "s".shiftwidth() : "t")'
endif

