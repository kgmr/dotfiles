set nocompatible              " be iMproved, required
filetype off                  " required
:set mouse=a
set expandtab ts=4 sw=4 ai
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
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'tpope/vim-surround'
Plugin 'lokaltog/vim-easymotion'
Plugin 'vim-syntastic/syntastic'
Plugin 'morhetz/gruvbox'
Plugin 'shinchu/lightline-gruvbox.vim'
Plugin 'mattn/emmet-vim'
Plugin 'shougo/neocomplete.vim'
Plugin 'shougo/neosnippet.vim'
Plugin 'shougo/neosnippet-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'itchyny/lightline.vim'
Plugin 'minibufexpl.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'posva/vim-vue'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Conf
set hlsearch
syntax enable
set background=light
:colorscheme solarized
set t_co=256
set relativenumber
"Set paste
nmap sp :set pastetoggle<CR>

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_by_filename = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"Enmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"Main key and esc
ino jj <esc>
cno jj <c-c>
"ezmotion
nmap f <Plug>(easymotion-overwin-f)


"Neocomplete
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"

endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
"snip

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"Tree
map tt :NERDTreeToggle<CR>
"Tags
nmap tg :TagbarToggle<CR> 
"Hardtime
let g:hardtime_default_on = 1
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
map <F5> :w<CR>
"space meme
nmap <space> :

"splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"jedi completion
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
