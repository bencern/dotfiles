" Muha's init.vim config for NeoVim - Linux
" This configuration is optimised for writing (markdown) and web dev (php, js,
" ts)

" =======================
"     VimPlug-Bundles
" =======================

call plug#begin()

" --- Aestethic ---
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'myusuf3/numbers.vim'


" --- Functions ---

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './instal --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'vim-scripts/loremipsum'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'metakirby5/codi.vim'
Plug 'sjl/gundo.vim'

" --- Writer Tools ---
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-wheel'
Plug 'reedes/vim-pencil'
Plug 'szw/vim-dict'

" --- Languages utilisation ---
Plug 'gabrielelana/vim-markdown'

call plug#end()

" --- Python3 virtualenv ---
let g:python3_host_prog = expand('~/.config/nvim/env/bin/python')

" --- Coloring ---
syntax on
color gruvbox
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

" --- Other Config and formatting ---
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\
set wrap breakindent
set encoding=utf-8
set number
set title
set cursorline
set showmatch

" --- Splitting ---
set splitbelow
set splitright

" --- Performance ---
set hidden
set lazyredraw

" --- history ---
set undolevels=999

" --- backup and swap ---
set nobackup
set nowritebackup
set noswapfile

" --- search ---
set hlsearch
set incsearch

" === Plugin Configuration ===

" --- NERDTree ---
let NERDTreeShowHidden=1

" --- Airline ---
let g:airline_powerline_fonts=0
let g:airline_section_z= '%{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''

" --- Neovim terminal ---
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" --- Deoplete ---
let g:deoplete#enable_at_startup=1
set completeopt-=preview

" --- Supertab ---
let g:SuperTabDefaultCompletionType= "<C-n>"

" --- ultisnips ---
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"

" --- EasyAlign ---
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" --- indentLine ---
let g:intentLine_char='|'
let g:indentLine_color_term=1

" --- TagBar ---
let g:tagbar_width=30

" --- Vim-Wheel ---
let g:wheel#map#up='<M-k>'
let g:wheel#map#down='<M-j>'

" --- fzf-vim ---
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
}

let g:fzf_colors = {
  \ 'fg': ['fg', 'Normal'],
  \ 'bg': ['bg', 'Normal'],
  \ 'hl': ['hl', 'Comment'],
  \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+': ['fg', 'Statement'],
  \ 'info': ['fg', 'Type'],
  \ 'border': ['fg', 'Ignore'],
  \ 'prompt': ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker': ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header': ['fg', 'Comment']
}

" === Filetype specific config ===

" --- HTML, XML, Jinja ---
autocmd Filetype html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd Filetype css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd Filetype xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd Filetype typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd Filetype htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{ }}<left><left><left>
autocmd FileType htmldjango inoremap {% {% %}<left><left><left>
autocmd FileType htmldjango inoremap {# {# #}<left><left><left>

" --- Markdown ---
autocmd FileType markdown,md setlocal shiftwidth=2 tabstop=2 softtabstop=2

" === Custom Functions ===

" --- Trim White Space at save ---

function! TrimWhiteSpace()
  let l:save = winsaveview()
  %s/\\\@<!\s\+$//e
  call winrestview(l:save)
endfunction

" === Keymap ===

" --- LEADER ---
let mapleader=','

" --- VBLX problem ---
noremap q $
nnoremap $ q
nnoremap dq d$
nnoremap cq c$
nnoremap yq y$
vnoremap q $
vnoremap $ q

" --- Softwrap movement ---
nnoremap k gk
nnoremap j gj

" --- Switch between split ---
map <C-h> <C-w><C-h>
map <C-l> <C-w><C-l>
map <C-j> <C-w><C-j>
map <C-k> <C-w><C-k>

" --- TimeStamp ---
inoremap <F3> <C-R>=strftime('%c')<CR>
inoremap <F3> :pu=strftime('%c')<CR>

" --- switch background color ---
map <leader>bg :let &background = (&background == 'dark' ? 'light':'dark')<CR>

" --- buffer ---
nmap <leader>nf :bn<CR>
nmap <leader>bf :bp<CR>
nmap <leader>bd :bd<CR>

" --- nospel nowrap ---
nmap <leader>nw :set nowrap<CR>
nmap <leader>wn :set wrap<CR>

" --- Translation ---
xmap <C-t><C-r> :!trans -t id

" --- Dictionary ---
xmap <C-d><C-c> :Dict

" --- Splitting ---
nmap <leader>ns :sp<CR>
nmap <leader>vs :vne<CR>

