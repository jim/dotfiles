filetype plugin indent on

" Basic Setup
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

" Keys
inoremap jj <esc>l
let mapleader = ","
nnoremap j gj
nnoremap k gk

set whichwrap+=<,>,h,l,[,]

tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Enable ESC in terminal mode
tnoremap <Esc> <C-\><C-n>

" Automatically enter insert mode in terminals
autocmd BufEnter term://* startinsert
autocmd BufLeave term://* stopinsert

nnoremap <leader>t :term<CR>i
nnoremap <leader>tr :vsp<CR><C-w>l :term<CR>i
nnoremap <leader>e :Explore<CR>

" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set lcs=tab:▒░,trail:▓
set nolist                        " Hide invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" Strip trailing whitespace in the current buffer
nnoremap <leader>w :call StripTrailingWhiteSpace()<CR>

" Strip trailing whitespace upon write
autocmd BufWritePre  *.{rb,js,coffee,scss,css,html,markdown,md,py} call StripTrailingWhiteSpace()

function! StripTrailingWhiteSpace()
  let l:winview = winsaveview()
  silent! %s/\s\+$//
  call winrestview(l:winview)
endfunction

" Wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

set gdefault
set showmatch
nnoremap <return> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Mouse
set mouse=a

" Open preview window below instead of above.
set splitbelow

"" Wild settings

" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Ignore output and VCS files
set wildignore+=*.o,*.out,*.obj,*.rbc,*.rbo,*.class,.svn,*.gem

" Ignore archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore temp and backup files
set wildignore+=*.swp,*~,._*

" Backup and swap files
set backupdir=~/.local/share/nvim/backup/
set directory=~/.local/share/nvim/temp/
set undofile
set undodir=~/.local/share/nvim/undo/

set laststatus=2
set autoindent
set noshowmode
set showcmd
set hidden
set visualbell
set cursorline
set ttyfast
set ruler
set termguicolors

let g:lexical#spelllang = ['en_us']

" Highlight merge conflict markers
match Todo '\v^(\<|\=|\>){7}([^=].+)?$'

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'neomake/neomake'
Plug 'NLKNguyen/papercolor-theme'
Plug 'cloudhead/neovim-fuzzy'
Plug 'tpope/vim-vinegar'
Plug 'posva/vim-vue'
Plug 'editorconfig/editorconfig-vim'

Plug 'Shougo/echodoc.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'wsdjeg/vim-fetch'

" Go
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" Gleam
Plug 'gleam-lang/gleam.vim'

" Crystal
Plug 'vim-crystal/vim-crystal'

if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  Plug 'zchee/deoplete-go', { 'do': 'make'}
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)

set background=dark
colorscheme PaperColor

let g:lightline = { 'colorscheme': 'PaperColor' }

" Prevent Vim from getting confused in multi-language files
autocmd FileType vue syntax sync fromstart

" Prevent vim-vue from performing exhuastive preprocessor checks
let g:vue_disable_pre_processors = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Disable auto-opening a buffer after completion
set completeopt-=preview

highlight Pmenu ctermbg=8 guibg=#262626 guifg=#5cbdbe
highlight PmenuSel ctermbg=1 guifg=#5cbdbe guibg=#ffffff
highlight PmenuSbar ctermbg=0 guibg=#343434 guifg=#606060

au BufRead,BufNewFile *.md setlocal textwidth=0

nnoremap <C-p> :FuzzyOpen<CR>
