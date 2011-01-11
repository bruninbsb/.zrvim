set title
set t_Co=256
set history=1000
set enc=utf-8
colorscheme zenburn

syntax on
set number
set hidden
set ignorecase
set smartcase
set scrolloff=3

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
"  set autoindent       " copy indent from current line when starting a new
set backspace=indent,eol,start
set ruler                  

autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead *.py nmap <F5> :!python %<CR>

autocmd BufRead *.py set tabstop=4
autocmd BufRead *.py set nowrap
autocmd BufRead *.py set go+=b

filetype plugin indent on
filetype plugin on
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

let g:pydiction_location = '/home/zr/.vim/after/ftplugin/pydiction/complete-dict'
let mapleader = ","
nmap <silent> <F3> :NERDTreeToggle<CR>

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.
set shortmess=atI
set viminfo='20,<50,s10,h,%

function! ResCur()
if line("'\"") <= line("$")
normal! g`"
return 1
endif
endfunction

augroup resCur
autocmd!
autocmd BufWinEnter * call ResCur()
augroup END
