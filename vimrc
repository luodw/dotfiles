set nocompatible
set number
set laststatus=2
set background=dark
set termguicolors
set backspace=indent,eol,start
set incsearch
set clipboard=unnamed
set hlsearch
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set completeopt-=preview
set cursorline  
set cursorcolumn  
set wildmenu
set hid
set showmatch
set scrolloff=10
set mouse=a
set omnifunc=syntaxcomplaate#Complete

" tablength exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType slim setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType sh  setlocal shiftwidth=4 tabstop=4

" when open file, go to last cur
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END


filetype on
filetype plugin on
filetype plugin indent on
syntax enable

let mapleader = ";"
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader><Leader> :bnext<CR>

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'morhetz/gruvbox'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'mileszs/ack.vim'
Plug 'Rip-Rip/clang_complete'
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim'
Plug 'moll/vim-node'
Plug 'jmcantrell/vim-virtualenv'
Plug 'mhinz/vim-startify'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-surround'
Plug 'racer-rust/vim-racer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'itchyny/calendar.vim'
call plug#end()

colorscheme gruvbox

" clang_complete
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif
"let g:clang_use_library = 1
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'

let g:jedi#force_py_version=3
let g:jedi#show_call_signatures = "2"
" ale setting
let g:ale_python_flake8_options='--max-line-length 120'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}


" supertab setting
let g:SuperTabDefaultCompletionType = "context"

" vimwiki
let g:vimwiki_list = [ {"path": "~/vimwiki/", "path_html": "~/vimwiki_html/", "syntax": "markdown", "ext": ".md", "auto_export": 0}]

" airline setting
set encoding=utf-8
"let g:airline_theme='default'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1  
let g:airline#extensions#virtualenv#enabled = 1

" markdown setting
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled=1
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1

" vim-go setting
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_info_mode = 'gocode'

" ag and ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" ctrlp setting
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" fzf
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>g :Rg<Cr>
" let g:gitgutter_highlight_lines = 1


" Carbon setting
vnoremap <leader>c :CarbonNowSh<CR>

" NERDTree 
nnoremap <leader>t :NERDTreeToggle<CR>
" tabbar
nnoremap <leader>tt :TagbarToggle<CR>

" for nerdtree and startify
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

let g:NERDTreeWinSize=30

" remove python warning
if has('python3')
  silent! python3 1
endif
