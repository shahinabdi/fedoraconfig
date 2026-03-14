" ==========================================
"   BASIC UI & NAVIGATION
" ==========================================
set number
set relativenumber
set scrolloff=8
set laststatus=2

" Minimal statusline
set statusline=%f\ %y\ %m%r%h%w\ [%{&fileencoding}]\ [%l/%L]\ [%p%%]


" ==========================================
"   INDENTATION & FORMATTING
" ==========================================
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

filetype plugin indent on


" ==========================================
"   SEARCH
" ==========================================
set hlsearch
set incsearch
set ignorecase
set smartcase

nnoremap <leader>h :nohlsearch<CR>


" ==========================================
"   SPLITS & WINDOW CONTROL
" ==========================================
set splitright
set splitbelow

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" ==========================================
"   PLUGINS (vim-plug)
" ==========================================
call plug#begin('~/.vim/plugged')

" LSP + Completion
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" File explorer
Plug 'preservim/nerdtree'

" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Code formatting
Plug 'rhysd/vim-clang-format'

" Git integration
Plug 'tpope/vim-fugitive'

" Comments
Plug 'tpope/vim-commentary'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

call plug#end()


" ==========================================
"   C / C++ SETTINGS
" ==========================================
autocmd FileType c,cpp setlocal cindent
autocmd FileType c,cpp setlocal formatoptions-=cro
autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 expandtab

" Clang-format
autocmd FileType c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>

" Build & run
autocmd FileType c nnoremap <F5> :!gcc % -o %< && ./%<<CR>
autocmd FileType c nnoremap <F6> :!gcc -g % -o %< <CR>


" ==========================================
"   LEADER KEY
" ==========================================
let mapleader = " "


" ==========================================
"   FILE EXPLORER
" ==========================================
nnoremap <C-n> :NERDTreeToggle<CR>


" ==========================================
"   SAVE / QUIT
" ==========================================
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>


" ==========================================
"   BUFFER NAVIGATION
" ==========================================
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprev<CR>


" ==========================================
"   TERMINAL (RIGHT SIDE)
" ==========================================
nnoremap <leader>tt :vert rightbelow terminal<CR>


" ==========================================
"   PYTHON / C RUNNERS
" ==========================================
nnoremap <leader>rp :w<CR>:!python3 %<CR>
nnoremap <leader>rc :w<CR>:!gcc % -o %:r && ./%:r<CR>


" ==========================================
"   TERMINAL MODE FIXES
" ==========================================
" Leave terminal mode with Ctrl+n
tnoremap <C-n> <C-\><C-n>

" Move between splits from terminal using Ctrl + hjkl
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

inoremap jk <Esc>
