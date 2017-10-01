set nocompatible              " be iMproved, required
filetype off                  " required
:set mouse=a

set expandtab
set shiftwidth=4
set tabstop=4
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'lokaltog/vim-easymotion'
Plugin 'shougo/deoplete.nvim'
Plugin 'zchee/deoplete-jedi'
Plugin 'shougo/neosnippet.vim'
Plugin 'shougo/neosnippet-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'ap/vim-buftabline'
Plugin 'farmergreg/vim-lastplace'
Plugin 'altercation/vim-colors-solarized'
Plugin 'neomake/neomake'
Plugin 'reedes/vim-colors-pencil'
"Requires flake8
Plugin 'nvie/vim-flake8'
"Requires tern (npm install -g tern)
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Yggdroot/indentLine'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'Dylanaraps/wal.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Conf
set hlsearch
syntax enable
"switcheroo
let hour = strftime("%H")
if 6 <= hour && hour < 18
  set background=light
else
  set background=dark
endif
"colorscheme PaperColor
colorscheme wal
set t_co=256

if exists ("*ToggleBackground") == 0
    function ToggleBackground()
        if &background == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction

    command Togglebg call ToggleBackground()
endif
map <F4> :Togglebg<CR>
set number
"Set paste

"Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_by_filename = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"Enmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"autosave
"Main key and esc
ino jj <esc>
cno jj <c-c>
"ezmotion
nmap f <Plug>(easymotion-overwin-f)

"Neomake

autocmd! BufWritePost * Neomake
"Neocomplete
" Use neocomplete.
let g:deoplete#enable_at_startup = 1
"python function docs
let g:deoplete#sources#jedi#show_docstring=1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
"snip

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"Tree
map tt :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=25
"Line
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ }
"buffers



let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
map gr :bprevious <CR>
map gt :bnext<CR>
"run
"space meme
nmap <space> :

"splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" paste
set pastetoggle=<F2>
"close scratch
autocmd CompleteDone * pclose
