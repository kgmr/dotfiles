colorscheme schellar
set guioptions-=r
if exists('g:GuiLoaded')
    Guifont Monaco:h11
    GuiTabline 0
end
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
