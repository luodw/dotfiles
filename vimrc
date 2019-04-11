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
set completeopt=menu,menuone,noselect,noinsert
set cursorline  
set cursorcolumn  
set wildmenu
set hid
set showmatch
set scrolloff=10
set mouse=a
set omnifunc=syntaxcomplete#Complete

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
autocmd FileType python  setlocal shiftwidth=2 tabstop=2

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

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

" setting before load ale
let g:ale_completion_enabled = 1

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'kien/ctrlp.vim'
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
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim'
Plug 'moll/vim-node'
Plug 'jmcantrell/vim-virtualenv'
Plug 'mhinz/vim-startify'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kristijanhusak/vim-carbon-now-sh'
"Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'itchyny/calendar.vim'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()

colorscheme gruvbox
" colorscheme zenburn
" Clear last search highlighting
nnoremap <Space> :noh<CR><ESC>
nnoremap <Leader><Leader> :bnext<CR>

" gf: go to module
nnoremap <Leader>d :TernDef<CR>
nnoremap <Leader>r :TernRefs<CR>

" nerdtree git status
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" multi-cursors
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" easymotion
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

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

let g:jedi#completions_enabled = 1
let g:jedi#force_py_version=3
let g:jedi#show_call_signatures = "2"
" ale setting

let g:ale_python_flake8_options='--max-line-length 120'
let g:ale_linters = {
\   'python': ['flake8', 'mypy', 'pylint'],
\   'javascript': ['eslint'],
\   'go': ['gofmt', 'golint', 'go vet'],
\   'rust': ['cargo', 'rustc'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'rust': ['rustfmt']
\}
let g:ale_rust_cargo_use_check = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" supertab setting
let g:SuperTabDefaultCompletionType = "context"

" airline setting
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1  
let g:airline#extensions#virtualenv#enabled = 1

" markdown setting
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled=1
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1
map <leader>md :InstantMarkdownPreview<CR>
" vim-go setting
let g:go_fmt_command = "goimports"
"let g:go_auto_type_info = 1
let g:go_info_mode = 'gocode'

" ag and ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" ctrlp setting
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" fzf 
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_action = { 'ctrl-e': 'edit' }
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-e> :Buffers<CR>
nnoremap <silent> <C-g> :Rg<CR>
" let g:gitgutter_highlight_lines = 1

let g:racer_cmd = "/usr/local/bin/racer"
let g:racer_experimental_completer = 1
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
