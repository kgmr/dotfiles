set clipboard=unnamedplus
:set mouse=a
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
Plug 'ap/vim-buftabline'
Plug 'farmergreg/vim-lastplace'
Plug 'airblade/vim-rooter'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'
Plug 'xolox/vim-misc'
Plug 'lervag/vimtex' 
Plug 'Yggdroot/indentLine'
Plug 'adelarsq/vim-matchit'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'mateusbraga/vim-spell-pt-br'
Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mileszs/ack.vim'
Plug 'jwalton512/vim-blade'
Plug 'StanAngeloff/php.vim'
Plug 'igungor/schellar'
Plug 'plan9-for-vimspace/acme-colors'
Plug 'olivertaylor/vacme'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'TimUntersberger/neogit'
Plug 'sindrets/diffview.nvim'

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

call plug#end()

"Conf
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"Enmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"Main key and esc
ino jj <esc>
cno jj <c-c>
"ezmotion
nmap f <Plug>(easymotion-overwin-f)
nmap <F3> :call CocAction('format')<cr>
let g:EasyMotion_keys='hklyuiopnmqwertzxcvbasdgjf'
"nmap F <Plug>(easymotion-F)
"nmap f <Plug>(easymotion-f)



hi! Pmenu ctermfg=2 ctermbg=9
set hlsearch
set number
lua require('plugins')
colorscheme default
colorscheme pywal
"Neomake
autocmd! BufWritePost * Neomake
"prettier

"fzf
"Tree
map tt :NERDTreeToggle<CR>
let g:NERDTreeWinSize=25
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
"Line
set laststatus=2
"buffers
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
map gk :bnext <CR>
map gj :bprevious<CR>
noremap <F9> :vsplit<CR>
noremap <F10> :split<CR>
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
map <F5> :Buffers<CR>

" remove buffer
noremap <F4> :bp\|bd #<CR>

" coc
"
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
"

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"fzf
nmap <F1> <cmd>Telescope find_files<cr>
" ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nmap <F2> <cmd>Telescope live_grep<cr>

