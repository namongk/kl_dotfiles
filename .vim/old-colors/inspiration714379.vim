" Generated by Inspiration at Sweyla
" http://inspiration.sweyla.com/code/seed/714379/

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "inspiration-714379"

if version >= 700
  hi CursorLine     guibg=#160000
  hi CursorColumn   guibg=#160000
  hi MatchParen     guifg=#FF0037 guibg=#160000 gui=bold
  hi Pmenu          guifg=#FFFFFF guibg=#323232
  hi PmenuSel       guifg=#FFFFFF guibg=#B77F3C
endif

" Background and menu colors
hi Cursor           guifg=NONE guibg=#FFFFFF gui=none
hi Normal           guifg=#FFFFFF guibg=#160000 gui=none
hi NonText          guifg=#FFFFFF guibg=#250F0F gui=none
hi LineNr           guifg=#FFFFFF guibg=#2F1919 gui=none
hi Normal           guifg=#FFFFFF guibg=#160000 gui=none
hi StatusLine       guifg=#FFFFFF guibg=#36190C gui=italic
hi StatusLineNC     guifg=#FFFFFF guibg=#3E2828 gui=none
hi VertSplit        guifg=#FFFFFF guibg=#2F1919 gui=none
hi Folded           guifg=#FFFFFF guibg=#160000 gui=none
hi Title            guifg=#B77F3C guibg=NONE	gui=bold
hi Visual           guifg=#FF0037 guibg=#250F0F gui=none
hi SpecialKey       guifg=#814A31 guibg=#250F0F gui=none

" Syntax highlighting
hi Comment guifg=#B77F3C gui=none
hi Constant guifg=#814A31 gui=none
hi Number guifg=#814A31 gui=none
hi Identifier guifg=#E06D66 gui=none
hi Statement guifg=#FF0037 gui=none
hi Function guifg=#DA108D gui=none
hi Special guifg=#FFE887 gui=none
hi PreProc guifg=#FFE887 gui=none
hi Keyword guifg=#FF0037 gui=none
hi String guifg=#BF5C41 gui=none
hi Type guifg=#8A9A87 gui=none
hi pythonBuiltin guifg=#E06D66 gui=none
