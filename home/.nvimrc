set nocompatible              " be iMproved, required
filetype off                  " required
:set mouse=a
set cc=80

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
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'lokaltog/vim-easymotion'
Plugin 'shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'zchee/deoplete-jedi'
Plugin 'shougo/neosnippet.vim'
Plugin 'shougo/neosnippet-snippets'
Plugin 'itchyny/lightline.vim'
Plugin 'ap/vim-buftabline'
Plugin 'farmergreg/vim-lastplace'
Plugin 'neomake/neomake'
Plugin 'scrooloose/nerdtree'
"Requires flake8
Plugin 'nvie/vim-flake8'
Plugin 'chriskempson/base16-vim'
Plugin 'vimwiki/vimwiki'
Plugin 'tbabej/taskwiki'
Plugin 'blindFS/vim-taskwarrior'
Plugin 'StanAngeloff/php.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/denite.nvim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'zchee/deoplete-clang' 
Plugin 'lervag/vimtex' 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Conf
let base16colorspace=256
set hlsearch
syntax enable
"switcheroo
let hour = strftime("%H")
if 6 <= hour && hour < 18
  set background=light
  colorscheme base16-tomorrow
else
  set background=dark
  colorscheme base16-gruvbox-dark-pale
endif
"colorscheme wal

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
set number
"Set paste

"Denite
nnoremap  <C-p> :Denite file_rec<CR>
nnoremap  tb :Denite buffer<CR>
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

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
let g:EasyMotion_keys='hklyuiopnmqwertzxcvbasdgjf'
"nmap F <Plug>(easymotion-F)
"nmap f <Plug>(easymotion-f)

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
:inoremap <C-v> <ESC>"+pa
:vnoremap <C-c> "+y
:vnoremap <C-d> "+d
"close scratch
autocmd CompleteDone * pclose
"clear search results
nnoremap <esc> :noh<return><esc>

" tex
let g:vimtex_view_method = 'zathura'

