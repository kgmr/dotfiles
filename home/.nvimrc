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
Plugin 'morhetz/gruvbox'
Plugin 'shinchu/lightline-gruvbox.vim'
Plugin 'shougo/deoplete.nvim'
Plugin 'zchee/deoplete-jedi'
Plugin 'shougo/neosnippet.vim'
Plugin 'shougo/neosnippet-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'minibufexpl.vim'
Plugin 'farmergreg/vim-lastplace'
Plugin 'mayansmoke'
Plugin 'altercation/vim-colors-solarized'
Plugin 'neomake/neomake'
"Requires flake8
Plugin 'nvie/vim-flake8'
Plugin 'mattn/emmet-vim'
"Requires tern (npm install -g tern)
Plugin 'carlitux/deoplete-ternjs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Conf
set hlsearch
syntax enable
set background=dark
:colorscheme solarized
set t_co=256
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
let g:auto_save = 0  " enable AutoSave on Vim startup
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
:let g:NERDTreeWinSize=27
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
"quicksave
map <F4> :AutoSaveToggle<CR>
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
