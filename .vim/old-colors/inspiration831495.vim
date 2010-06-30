" Generated by Inspiration at Sweyla
" http://inspiration.sweyla.com/code/seed/831495/

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "inspiration-831495"

if version >= 700
  hi CursorLine     guibg=#000807
  hi CursorColumn   guibg=#000807
  hi MatchParen     guifg=#22C4D5 guibg=#000807 gui=bold
  hi Pmenu          guifg=#FFFFFF guibg=#323232
  hi PmenuSel       guifg=#FFFFFF guibg=#8A6C40
endif

" Background and menu colors
hi Cursor           guifg=NONE guibg=#FFFFFF gui=none
hi Normal           guifg=#FFFFFF guibg=#000807 gui=none
hi NonText          guifg=#FFFFFF guibg=#0F1716 gui=none
hi LineNr           guifg=#FFFFFF guibg=#192120 gui=none
hi Normal           guifg=#FFFFFF guibg=#000807 gui=none
hi StatusLine       guifg=#FFFFFF guibg=#1B1C12 gui=italic
hi StatusLineNC     guifg=#FFFFFF guibg=#28302F gui=none
hi VertSplit        guifg=#FFFFFF guibg=#192120 gui=none
hi Folded           guifg=#FFFFFF guibg=#000807 gui=none
hi Title            guifg=#8A6C40 guibg=NONE	gui=bold
hi Visual           guifg=#22C4D5 guibg=#0F1716 gui=none
hi SpecialKey       guifg=#337095 guibg=#0F1716 gui=none

" Syntax highlighting
hi Comment guifg=#8A6C40 gui=none
hi Constant guifg=#337095 gui=none
hi Number guifg=#337095 gui=none
hi Identifier guifg=#AD556A gui=none
hi Statement guifg=#22C4D5 gui=none
hi Function guifg=#5C9FA8 gui=none
hi Special guifg=#E81E1C gui=none
hi PreProc guifg=#E81E1C gui=none
hi Keyword guifg=#22C4D5 gui=none
hi String guifg=#FF8C8C gui=none
hi Type guifg=#72E400 gui=none
hi pythonBuiltin guifg=#AD556A gui=none