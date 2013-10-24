" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let mapleader = "\\"
let g:AckAllFiles = 0
Bundle 'gmarik/vundle'

" Bundles
Bundle 'vcscommand.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
"Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-fugitive'
Bundle 'desert256.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'bufexplorer.zip'
Bundle 'tComment'
Bundle 'ack.vim'
Bundle 'kien/ctrlp.vim'

syntax enable

set mouse=a"Let mouse scrolling work in tmux
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set incsearch
set number
set autoindent

nnoremap <Leader>t :CtrlP<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>nh :nohlsearch<CR>
nnoremap <Leader>ff :FufFile<CR>
nnoremap <Leader>rd Orequire 'debugger'; debugger<Esc>
nnoremap <Leader>rt :!ctags -R<CR>
nnoremap <silent> <Leader>cc :TComment<CR>
nnoremap <Leader>aw :Ack '<C-R><C-W>'

if hostname() == 'tcastiglione.backstop.local'
    set background=light
else
    set background=dark
end
colorscheme solarized
