set gdefault                  
:set mouse=a
set cc=80

set expandtab
set shiftwidth=4
set tabstop=4
set ignorecase
set smartcase

"plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'lokaltog/vim-easymotion'
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'farmergreg/vim-lastplace'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'
Plug 'blindFS/vim-taskwarrior'
Plug 'mattn/emmet-vim'
Plug 'xolox/vim-misc'
Plug 'lervag/vimtex' 
Plug 'Yggdroot/indentLine'
Plug 'adelarsq/vim-matchit'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'mateusbraga/vim-spell-pt-br'
Plug 'dylanaraps/wal.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '~/.fzf'
Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mileszs/ack.vim'

call plug#end()

"Conf
let base16colorspace=256
set hlsearch
syntax enable
colorscheme wal

set number
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"Enmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
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

"Tree
map tt :NERDTreeToggle<CR>
let g:NERDTreeWinSize=25
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
"Line
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'default',
      \ }
"buffers
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
map gr :bprevious <CR>
map gt :bnext<CR>
noremap <F3> :colorscheme wal<CR>
noremap <F4> :colorscheme base16-gruvbox-dark-pale<CR>
"space meme
nmap <space> :

"splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" paste
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
"clear search results
nnoremap <esc> :noh<return><esc>

" tex
let g:vimtex_view_method = 'zathura'

" jump points
inoremap <Leader>c <++>
inoremap <leader>n <Esc>/<++><Enter>"_c4l
noremap <leader>n <Esc>/<++><Enter>"_c4l
"spellchecking
map <F6> :setlocal spell! spelllang=pt_br<CR>
map <F7> :setlocal spell! spelllang=en_us<CR>
let spell_auto_type="tex,md,txt"
nnoremap zz z=
map <F5> :w<CR> :!clear; make<CR> :!./%<<CR>

" remove buffer
noremap bd :bp\|bd #<CR>

" coc
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
"set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" snips
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nmap <F1> :FZF<cr>
" ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nmap <F2> :Ack<SPACE>
