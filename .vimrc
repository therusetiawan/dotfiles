" File: .vimrc
" Author: Jake Zimmerman <jake@zimmerman.io>
" Modified: Heru Setiawan <me.herusetiawan@gmail.com>
"

" Gotta be first
set nocompatible

" Store swp file in one place
set directory^=$HOME/.vim/tmp//

filetype off

call plug#begin('~/.vim/plugged')

" ----- Making Vim look good ------------------------------------------
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ----- Vim as a programmer's text editor -----------------------------
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-syntastic/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/a.vim'

" ----- Working with Git ----------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plug 'Raimondi/delimitMate'

" ----- man pages, tmux -----------------------------------------------
Plug 'jez/vim-superman'
Plug 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plug 'jez/vim-c0'
Plug 'jez/vim-ispc'
Plug 'kchmck/vim-coffee-script'

"----- Ruby on Rails --------------------------------------------------
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'

"----- Line bubble -----------------------------------------------------
Plug 'tpope/vim-unimpaired'

"----- Show Indent line ------------------------------------------------
Plug 'Yggdroot/indentLine'

"----- Vim comment line -----------------------------------------------
Plug 'vim-scripts/tComment'

"----- Vim editor config-----------------------------------------------
Plug 'editorconfig/editorconfig-vim'

" ----- Vim for ruby --------------------------------------------------
Plug 'vim-ruby/vim-ruby'

" ----- YML file -----------------------------------------------------
Plug 'chase/vim-ansible-yaml'

" ----- Plugin for Golang --------------------------------------------
Plug 'fatih/vim-go'

call plug#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set autoindent
set cindent
set wrap
set breakindent

" --- Set tab 2 space
" set tabstop=2
" set shiftwidth=2
" set softtabstop=0
" set expandtab

syntax on

" Prevent auto add new line in eof
set binary
set noeol

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=256

" Set the colorscheme
colorscheme solarized


" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Use the solarized theme for the Airline status bar
let g:airline_theme='solarized'

" Only show file name in tab, not file directory
let g:airline#extensions#tabline#fnamemod = ':t'

" ----- Map leader key ------------
let mapleader = ","

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with ,t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1


" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1


" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)


" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- jez/vim-superman settings -----
" better man page support
noremap K :SuperMan <cword><CR>

" Change size of nerdtree window
let g:NERDTreeWinSize=33

" Set layout
set colorcolumn=90
set textwidth=90

" Maping tab to reach easier
nnoremap tl  :tabnext<CR>
nnoremap th  :tabprev<CR>
nnoremap td  :tabclose<CR>
nnoremap tn  :tabnew<CR>
let g:EditorConfig_core_mode = 'external_command'
