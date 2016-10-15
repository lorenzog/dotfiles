" Vim color file
" Maintainer:   Yuheng Xie <elephant@linux.net.cn>
" Last Change:  2005 Apr 6

" This color scheme uses a black background.

" First remove all existing highlighting.
" why?
set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "greens"

hi Cursor                         guifg=Black      guibg=#FFBF00
hi Normal      ctermfg=Grey       guifg=#A4A090    guibg=Black        ctermbg=Black
hi Visual                         guifg=Black      guibg=#C4C090      gui=NONE

hi Comment     ctermfg=DarkGreen  guifg=DarkGreen
hi Constant    ctermfg=Red        guifg=Red
hi Special     ctermfg=DarkRed    guifg=DarkRed
hi Identifier  ctermfg=Cyan       guifg=Cyan
hi Statement   ctermfg=Yellow     guifg=Yellow                        gui=NONE
hi PreProc     ctermfg=Green      guifg=Green
hi Type        ctermfg=White      guifg=White                         gui=NONE
hi Ignore      ctermfg=DarkGrey   guifg=#22201C

hi FoldColumn                     guifg=#C4C0B0    guibg=#42403C
hi Folded                         guifg=#C4C0B0    guibg=#22201C

highlight DiffAdd    cterm=underline ctermbg=DarkBlue 
highlight DiffDelete cterm=underline ctermfg=DarkBlue 
highlight DiffChange ctermbg=DarkBlue gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermbg=Red gui=none guifg=bg guibg=Red

" vim: ts=2 sw=2
"hi StatusLine ctermfg=black ctermbg=darkgreen
hi TabLineFill ctermfg=black
hi TabLineSel ctermfg=white ctermbg=black
hi TabLine ctermfg=black ctermbg=white
