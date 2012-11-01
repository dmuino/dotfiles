set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set encoding=utf-8
set showcmd

Bundle 'gmarik/vundle'

" My Bundles here:
"
Bundle 'tpope/vim-fugitive'
Bundle "tpope/vim-git"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-commentary"
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle "tyru/current-func-info.vim"
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'derekwyatt/vim-scala'
Bundle 'altercation/vim-colors-solarized'
Bundle 'hallettj/jslint.vim'
Bundle 'jnwhiteh/vim-golang'
Bundle "pangloss/vim-javascript"
Bundle "ervandew/supertab"

scriptencoding utf-8                    " UTF8 All day, every day
set directory=~/tmp/                    " Set temporary directory (don't litter local dir with swp/tmp files)

" Set it to internal VIM Help
set keywordprg=:help

if v:version >= 703
  " Set undofile.
  set undofile
  let &undodir=&directory
endif
set noswapfile                          " No swap files when editing please
set completeopt=menuone,preview

" Ignore case on insert completion
set infercase

set matchpairs+=<:>                     " Also match angle brackets

" Round indent by a multiple of shiftwidth in indent mode
set shiftround

set number                              " Enable line numbers
set numberwidth=3                       " Set line number column width 

syntax enable
"" Whitespace
set ts=4 sts=4 sw=4 
set expandtab
set autoindent smartindent 
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" use comma as <Leader> key instead of backslash
let mapleader=","

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>pe :! p4 edit %<cr>
map <leader>ps :! p4 submit ...<cr>
map <leader>cd :cd %:h <cr>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

cmap w!! %!sudo tee > /dev/null %

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv


" always add the current file's directory to the path if not already there
autocmd BufRead *
       \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
       \ exec "set path-=".s:tempPath |
       \ exec "set path+=".s:tempPath


set laststatus=2
set t_Co=256
set wildignore=*.class,*.o,out,*.jar,target/*,dist/*,build/*,javadoc/*,*/build/*
set background=dark
let g:Powerline_symbols='fancy'
let g:Powerline_colorscheme='default'

autocmd BufRead *.go set makeprg=go\ build
au FileType crontab set nobackup nowritebackup

filetype plugin indent on       " load file type plugins + indentation
