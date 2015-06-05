" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let mapleader = "\\"
let g:AckAllFiles = 0
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!bundle exec rspec {spec}"
Bundle 'gmarik/vundle'

" Bundles
Bundle 'vcscommand.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'bufexplorer.zip'
Bundle 'tComment'
Bundle 'ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'thoughtbot/vim-rspec'
Bundle 'slim-template/vim-slim.git'
Plugin 'jelera/vim-javascript-syntax'

syntax enable

set mouse=a"Let mouse scrolling work in tmux
set ttymouse=xterm2"Let mouse scrolling work in tmux
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set incsearch
set autoindent
set nrformats=
set background=dark
set bs=indent,eol,start
set colorcolumn=80
" set relativenumber
set number

nnoremap <F5> :tnext<CR>
nnoremap <F4> :tprev<CR>
nnoremap <Leader>t :CtrlP<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>nh :nohlsearch<CR>
nnoremap <Leader>rd Orequire 'debugger'; debugger<Esc>
nnoremap <Leader>rt :!ripper-tags -R --exclude=vendor<CR>
nnoremap <silent> <Leader>cc :TComment<CR>
nnoremap <Leader>aw :Ack '<C-R><C-W>'
nnoremap <Leader>st :call RunNearestSpec()<CR>
nnoremap <Leader>ss :call RunCurrentSpecFile()<CR>
nnoremap <Leader>sl :call RunLastSpec()<CR>
nnoremap <Leader>sa :call RunAllSpecs()<CR>

function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <silent> <Leader>ws :call <SID>StripTrailingWhitespace()<CR>

colorscheme solarized
