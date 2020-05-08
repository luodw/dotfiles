set nocompatible
set number
"set relativenumber
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
set completeopt=longest,menu,menuone,noselect,noinsert
set cursorline  
set cursorcolumn  
set wildmenu
set hid
set showmatch
set scrolloff=10
set mouse=a
set showcmd
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

" when open file, go to last cur
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')


filetype on
filetype plugin on
filetype plugin indent on
syntax enable

let mapleader = ";"

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
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
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'haya14busa/incsearch.vim'
call plug#end()

colorscheme gruvbox
"colorscheme onedark
hi HighlightedyankRegion term=bold ctermbg=0 guibg=#2a353d
highlight! goDeclsFzfComment ctermbg=196 ctermfg=255 cterm=BOLD guibg=#ff0000 guifg=#eeeeee gui=BOLD

highlight link CocErrorSign GruvboxRed

" colorscheme zenburn
" Clear last search highlighting
nnoremap <Leader><Leader> :bnext<CR>
" gf: go to module
nnoremap <Leader>d :TernDef<CR>
nnoremap <Leader>r :TernRefs<CR>

" nerdtree git status
highlight! link NERDTreeFlags NERDTreeDir
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
" ale setting

let g:ale_linters = {
\   'python': ['pylint'],
\   'javascript': ['eslint'],
\   'go': ['gofmt', 'golint', 'go vet'],
\   'rust': ['cargo'],
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
let g:ale_yaml_yamllint_options = '--config-file ~/.yamllint'
let g:ale_python_flake8_options = '--max-line-length 120'
let g:ale_python_pylint_options = '--rcfile ~/.pylintrc'

" supertab setting
let g:SuperTabDefaultCompletionType = "context"

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" airline setting
set encoding=utf-8
let g:airline_theme='onedark'
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
map <leader>e :GoDecls<CR>
map <leader>ed :GoDeclsDir<CR>
let g:go_code_completion_enabled = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 0
let g:go_info_mode = 'gocode'
let g:go_def_mode='godef'
let g:go_doc_popup_window = 1
let g:go_decls_mode = 'fzf'
let g:go_highlight_functions = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_parameters = 0
let g:go_highlight_format_strings = 1

let g:go_term_enabled = 1
let g:go_term_mode = "split"
let g:go_term_height = 13
let g:go_list_type = "quickfix"

let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_chan_whitespace_error = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_trailing_whitespace_error = 0

let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
" ag and ack
"let g:ackprg = 'ag --nogroup --nocolor --column'
if executable('rg')
  let g:ackprg = 'rg --column --line-number  --smart-case'
endif

" ctrlp setting
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" fzf 
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-e': 'edit',
  \ 'ctrl-v': 'vsplit'}
let g:fzf_layout = { 'down': '~40%' }
"let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Function to create the custom floating window
function! FloatingFZF()
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)

  " 90% of the height
  let height = float2nr(&lines * 0.5)
  " 60% of the height
  let width = float2nr(&columns * 0.8)
  " horizontal position (centralized)
  let horizontal = float2nr((&columns - width) / 2)
  " vertical position (one line down of the top)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }

  " open the new window, floating, and enter to it
  call nvim_open_win(buf, v:true, opts)
endfunction

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-e> :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>hc :History:<CR>
nnoremap <silent> <leader>hs :History/<CR>
nnoremap <silent> <leader>gm :Commits<CR>
nnoremap <silent> <leader>gbm :BCommits<CR>
nnoremap <silent> <leader>gg :GFiles?<CR>
nnoremap <silent> <leader>ag :Ag<Space>
nnoremap <silent> <leader>a :Ack<Space>
nnoremap <silent> <leader>rg :Rg<Space>
nnoremap <silent> <leader>l :Lines<Space>
nnoremap <silent> <leader>bl :BLines<Space>

command! -bang Colors
  \ call fzf#vim#colors({'down': '35%', 'options': '--reverse --margin 0%,0'}, <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


" let g:gitgutter_highlight_lines = 1

let g:racer_cmd = "/usr/local/bin/racer"
let g:rustfmt_autosave = 1
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
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
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" aerojump
" Create mappings (with leader)
nmap <Leader>as <Plug>(AerojumpSpace)
nmap <Leader>ab <Plug>(AerojumpBolt)
nmap <Leader>aa <Plug>(AerojumpFromCursorBolt)
nmap <Leader>ad <Plug>(AerojumpDefault)  

" remove python warning
if has('python3')
  silent! python3 1
endif
