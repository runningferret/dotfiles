" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set updatetime=100
let mapleader = "\\"
let g:AckAllFiles = 0
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!bundle exec rspec {spec}"
let NERDTreeShowHidden=1
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'


  let g:ackprg = 'ag --nogroup --nocolor --column'
  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

Bundle 'gmarik/vundle'

" Bundles
Bundle 'vcscommand.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'sickill/vim-monokai'
Bundle 'scrooloose/nerdtree'
Bundle 'bufexplorer.zip'
Bundle 'tComment'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'thoughtbot/vim-rspec'
Bundle 'slim-template/vim-slim.git'
" Bundle 'sjl/vitality.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'wincent/terminus'
" Plugin 'tmux-plugins/vim-tmux-focus-events'



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
set ttymouse=sgr

nnoremap <F5> :tnext<CR>
nnoremap <F4> :tprev<CR>
nnoremap <Leader>t :CtrlP<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>nh :nohlsearch<CR>
nnoremap <Leader>rd Orequire 'pry'; binding.pry<Esc>
nnoremap <Leader>rt :!ctags -R --exclude=vendor --exclude=node_modules<CR>
nnoremap <silent> <Leader>cc :TComment<CR>
nnoremap <Leader>aw :Ack! '<C-R><C-W>'
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

colorscheme monokai
set re=1 
