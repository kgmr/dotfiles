#switcheroo
let hour = strftime("%H")
if 6 <= hour && hour < 18
      set background=light
  else
        set background=dark
    endif
colorscheme solarized
:Guifont Meslo LG M:h11
