" Бенарда бен's init.vim config for NeoVim
" The environment is used for javascript  , angular , python , markdown ,
" and vim language .

" --- status line ---
set laststatus=2

" --- set tabs to space ---
set expandtab
set tabstop=2
set softtabstop=0
set shiftwidth=2

" --- set linespace ---
set linespace=0
set cursorline
set showmatch

" --- set split settings ---
set splitbelow
set splitright

" =============================
"         VimPlug-Bundles
" =============================
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-dispatch'
Plug 'sjl/Gundo.vim'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-slash'
Plug 'shougo/vimproc.vim', {'do' : 'make'}

" --- snippet and completion ---
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/denite.nvim'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/neoinclude.vim'
Plug 'shougo/echodoc.vim'
Plug 'ervandew/supertab'
Plug 'shougo/neosnippet.vim'
Plug 'honza/vim-snippets'
Plug 'shougo/neosnippet-snippets'
Plug 'shougo/neco-syntax'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'poppyschmo/deoplete-latex'
Plug 'mhartington/nvim-typescript'
Plug 'shougo/neco-vim'
Plug 'shougo/deoplete-rct'
Plug 'zchee/deoplete-clang'

" --- Denite ---
Plug 'shougo/defx.nvim'
Plug 'shougo/neomru.vim'

" --- Status Line ---
Plug 'vim-airline/vim-airline'

" --- Themes ---
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-janah'

" --- Some visualisation ---
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'myusuf3/numbers.vim'
Plug 'teto/vim-listchars'
Plug 'scrooloose/syntastic'

" --- utilities and formatting ---
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'lilydjwg/colorizer'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
Plug 'rstacruz/vim-hyperstyle'

" --- external interface ---
Plug 'wakatime/vim-wakatime'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/calendar.vim'
Plug 'shougo/vimshell.vim'

" --- Languages ---
Plug 'pangloss/vim-javascript'
Plug 'gabrielelana/vim-markdown'
Plug 'othree/html5.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'elzr/vim-json'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/ng-tsserver'
Plug 'lervag/vimtex'
Plug 'Chiel92/vim-autoformat'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'cespare/vim-toml'
Plug 'maralla/vim-toml-enhance'
Plug 'wavded/vim-stylus'

" --- Writers tools ---
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-wheel'
Plug 'szw/vim-dict'

" --- Vim devicons always ask to be at bottom ---
Plug 'ryanoasis/vim-devicons'

call plug#end()

" --- Syntax Highlighting ---
set t_Co=256
set background=dark
colorscheme gruvbox
set encoding=utf-8 nobomb

" --- performance / buffer ---
set hidden
set lazyredraw
set ttyfast

" --- history / file handling ---
set undolevels=999

" --- backup and swap files ---
set nobackup
set nowritebackup
set noswapfile

" --- search ---
set hlsearch
set incsearch

" ============================
"       Plugin Settings
" ============================

" --- Airline ---
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ctrlp#show_adjacent_modes=1
let g:airline#extensions#wordcount#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensons#branch#format=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

" --- Number ---
let g:numbers_exclude=['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
set number

" --- Nerd-Commenter ---
let g:NERDSpaceDelims=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1

" --- indent line ---
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

" --- ultisnips --- Currently not used.
" let g:UltiSnipsExpandTrigger="<C-Enter>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"
" let g:UltiSnipsJumpBackwardTrigger="<C-l>"
" let g:UltiSnipsUsePythonVersion=3
" let g:UltiSnipsRemoveSelectModeMappings=0

" --- NerdTree ---
map <M-e> :NERDTreeToggle<CR>

" --- Tagbar ---
nmap <F7> :TagbarToggle<CR>

" --- Gundo ---
nmap <F8> :GundoToggle<CR>

" --- Calendar ---
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1 

" --- Vim Pencil ---
let g:pencil#wrapModeDefault = "soft"
augroup pencil
  autocmd!
  autocmd FileType markdown,md call pencil#init()
augroup END

nmap <leader>ps :PencilSoft<CR>
nmap <leader>hp :HardPencil<CR>

" --- CtrlP ---
if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))
  let g:ctrlp_working_path_mode='ra'
endif

" --- Syntastic ---
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_html_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['eslint']

" --- YouCompleteMe --- Currently I don't use this YCM.
" let g:ycm_python_binary_path = 'python3'
" if !exists("g:ycm_semantic_triggers")
  " let g:ycm_semantic_triggers = {'cs,javascript,typescript,python': ['.']}
" endif

" --- vim-markdown ---
let g:markdown_enable_folding=1
let g:markdown_enable_spell_checking=0
let g:markdown_enable_conceal=1

" --- Tsuquyomi ---
let g:tsuquyomi_completion_detail = 1

" --- deoplete ---
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#enable_at_startup = 1
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'
let g:deoplete#sources#latex#include_web_math = 1
let g:deoplete#sources#latex#include_misc = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#tag#cache_limit_size = 10000000
let g:deoplete#max_list = 60
let g:deoplete#file#enable_buffer_path = 1

set completeopt-=preview
set completeopt+=noinsert
set completeopt+=noselect

" --- Supertab ---
let g:SuperTabDefaultCompletionType = "<C-n>"

" --- Vim Wheel ---
let g:wheel#map#up = '<M-k>'
let g:wheel#map#down = '<M-j>'

" --- Neosnippet ---
imap <C-CR> <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets'

" --- deoplete-clang ---
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#clang#std = {'c': 'c11', 'cpp': 'c++1z'}

" ===========================
"         KEYMAPS
" ===========================

" --- LEADER ---
let mapleader = ","

" --- completion ---
inoremap <C-Space> <C-n>

" --- move between split made easy ---
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" --- map $ to q, dvorak matter ---
nnoremap q $
nnoremap $ q
nnoremap dq d$
nnoremap cq c$
vnoremap q $
vnoremap $ q

" --- softwrap movement workaround ---
nnoremap k gk
nnoremap j gj

" --- Timestamp ---
inoremap <F3> <C-R>=strftime("%c")<CR>
nnoremap <F3> :pu=strftime('%c')<CR>

" --- Switch background color ---
map <leader>bg :let &background = (&background == "dark" ? "light":"dark")<CR>

" --- move around buffer ---
nmap <leader>nf :bn<CR>
nmap <leader>bf :bp<CR>

" --- nospell nowrap ---
nmap <leader>ns :set nospell<CR>
nmap <C-&> :set nowrap <CR>

" --- Splitting ---
nmap <leader>ns :sp<CR>
nmap <leader>vs :vne<CR>

" --- Translation ---
map <leader>tr :!trans -t id

" --- Dictionary ---
nmap <leader>dc :Dict 

" --- Airline ---
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" --- Shiba ---
" map <F5> :!shiba --detach %<CR>
map <F5> :call RunFiles()<CR>

" --- function calls ---
function! RunFiles()
  let tipeFile = &filetype
  if tipeFile == "cpp"
    call RunCPP()
  endif
endfunction

" === Functions ===
function! RunCPP()
  let thename = "Debug_App"
  execute "!g++ " . bufname("%") . " -o " . thename
  if exists("%:p:h" . "Debug_App")
    execute "!./Debug_App"
  endif
  execute "!./Debug_App"
endfunction
