" vim:fdm=marker

" COMMON {{{
set nocompatible
filetype off
filetype plugin indent off

set cpoptions=aABceFsmq
set autochdir
set nostartofline " don't jump to the first character when paging
set title
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set ttyfast

let mapleader = ','
let g:mapleader = ','
let localleader = '\'
let g:localleader = '\'
let leader = ','
let g:leader = ','

set runtimepath+=$GOROOT/misc/vim
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" }}}

" BUNDLES {{{
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'mjbrownie/django-template-textobjects'
Bundle 'mjbrownie/html-textobjects'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-repeat'
Bundle 'lucapette/vim-textobj-underscore'
Bundle 'ack.vim'
Bundle 'Buffergator'
Bundle 'delete-surround-html'
Bundle 'Soares/butane.vim'
Bundle 'ctrlp.vim'
Bundle 'tpope/vim-commentary'
Bundle 'Gundo'
Bundle 'vim-flake8'
Bundle 'vim-coffee-script'
Bundle 'less.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Python-mode-klen'
Bundle 'wakatime/vim-wakatime'
Bundle 'SuperTab'
Bundle 'davidhalter/jedi-vim'
Bundle 'bling/vim-bufferline'
Bundle 'sessionman.vim'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'fugitive.vim'
Bundle 'Tagbar'
Bundle 'jnwhiteh/vim-golang'
Bundle 'xolox/vim-misc'
Bundle 'easytags.vim'
Bundle 'bling/vim-airline'
Bundle 'Rykka/riv.vim'
Bundle 'mattn/emmet-vim'
Bundle 'mattboehm/vim-unstack'
Bundle 'mattboehm/vim-accordion'
Bundle 'kshenoy/vim-signature'
Bundle 'unite.vim'
Bundle 'Shougo/vimfiler.vim'
Bundle 'myhere/vim-nodejs-complete'
Bundle 'reedes/vim-colors-pencil'
" }}}

" DISPLAY {{{
set ruler
set number
set showcmd
set laststatus=2
set winminheight=0
set winminwidth=0
set winheight=10
set display+=lastline
set textwidth=0
set wrapmargin=10
set numberwidth=5
" }}}

" BEHAVIOR {{{
set autoread
set noautowrite
set visualbell
set t_vb= " visual bell
set shellcmdflag=-c
set shell=bash\ -l
set modeline
set modelines=5
set tabpagemax=100
set mousemodel=extend
set mouse=a
set ttymouse=xterm2
set noea
set shortmess=aOstTI " shortens messages to avoid 'press a key' prompt
set magic
set viminfo='10,\"100,:20,%,n~/.viminfo
set confirm
set report=0
set smartcase

" Saving sessions
set sessionoptions=buffers,folds,tabpages
" }}}

" TEXT EDITING {{{
set imd
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*~,.lo,*.pyc,*.bak,*.jpg,*.png,*.gif
set whichwrap=b,s,h,l,<,>,~,[,] "everything wraps
set undolevels=5000
set autoindent
set preserveindent
set nosmartindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wrap
set formatoptions=lcroqwan2vb1
set showmatch
set matchtime=5
set list
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:-
set showbreak=…
set encoding=utf-8 fileencodings=.
set showfulltag
set completeopt=longest,menuone,preview
set isk-=_ " Don't consider underscores to be word characters
set ts=4
set sts=4
set sw=4
set expandtab
" }}}

" FOLDS {{{
set foldmethod=manual
set foldenable
set foldopen=block,hor,mark,percent,quickfix,tag
set foldminlines=2
set fillchars+=fold:\
set foldcolumn=2
" }}}

" BUFFERS {{{
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
set bufhidden=hide
set hidden " you can change buffers without saving
set switchbuf=usetab
set splitright
set splitbelow
set scrolloff=2
set sidescrolloff=2
set showtabline=1
" }}}

" COLORS {{{
syntax on
set t_Co=256
set background=dark
colorscheme pencil
hi NonText ctermfg=59 guifg=gray
hi SpecialKey ctermfg=59

" Use the below highlight group when displaying bad whitespace is desired.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" full Python syntax highlighting
let python_highlight_all=1
let g:pyflakes_use_quickfix=1

" use brief mode for Javascript indenter
let g:SimpleJsIndenter_BriefMode = 1

" }}}

" STATUS LINE {{{
set laststatus=2

" recalculate the warning flags when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning
" }}}

" BACKUPS {{{
set nowb
set noswapfile
set nobackup
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
set history=500
set updatecount=100
" }}}

" SEARCH {{{
set incsearch   " do incremental searching
set ignorecase
set infercase
set hlsearch
set showmatch
set diffopt=filler,iwhite
nnoremap / /\v
vnoremap / /\v
set gdefault
set tags=/Users/kennethlove/.vimtags
" }}}

" COMMAND-LINE {{{
cno $q <C-\>eDeleteTilSlash()<CR>
" }}}

" SETTINGS PER FILETYPE {{{
filetype plugin indent on
if has("autocmd")
    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab

    " Customisations based on house-style (arbitrary)
    autocmd FileType * setlocal ts=4 sts=4 sw=4 expandtab

    autocmd BufWritePost *.py call Flake8()

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setlocal filetype=xml

    " Autodetect todo files
    autocmd BufNewFile,BufRead *.todo setlocal filetype=todo

    " Autodetect Actionscript files
    au BufNewFile,BufRead *.as setlocal filetype=actionscript

    " Autodetect LESS files as CSS
    au BufNewFile,BufRead *.less setlocal filetype=css

    " Automatically strip extraneous whitespace when saving Python or
    " Javascript files.
    "autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()

    " markdown
    augroup mkd
        autocmd BufRead *.mkd  setlocal ai formatoptions=tcroqn2 comments=n:>
    augroup END

    autocmd BufRead,BufNewFile,BufEnter *.rst set ft=rest

    " JSON syntax
    au! BufRead,BufNewFile *.json setlocal filetype=json

    " jQuery syntax
    au! BufRead,BufNewFile *.js setlocal ft=javascript.jquery

    " Display tabs at the beginning of a line in Python mode as bad
    au BufRead,BufNewFile *.py,*.pyw match ExtraWhitespace /^\t\+/
    " Make trailing whitespace be flagged as bad
    " au BufRead,BufNewFile *.py,*.pyw match ExtraWhitespace /\s\+$/
    au BufRead,BufNewFile *.py,*.pyw let python_space_errors = 1
    au BufRead,BufNewfile *.py,*.pyw call s:HighlightLongLines(79)

    " only UNIX line endings.
    au BufNewFile *.* set fileformat=unix

    autocmd BufEnter * :syntax sync fromstart

    autocmd BufRead *.html setlocal filetype=htmldjango
    autocmd BufRead *.py setlocal smartindent cinwords=if,else,elif,for,while,try,except,finally,def,class

    " mapping to mark HTML5 files
    autocmd BufEnter *html nmap <F7> :setfiletype html5<CR>

    if version >= 700
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete colorcolumn=80
        autocmd FileType css,sass setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,htmldjango setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
        autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
        autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    endif

    " Python, CSS, XML, and HTML file shoulds be folded based on indent
    au BufNewFile,BufRead *py,*css,*xml,*htm*,*as setlocal foldmethod=indent

    " CSS and Sass files should see - as part of a keyword
    au! BufRead,BufNewFile *.sass,*.scss setlocal filetype=sass

    " JS
    augroup js
        autocmd!
        au FileType javascript,javascript.jquery,json setlocal foldmethod=indent
    augroup END

    " USE GOOGLE'S JAVASCRIPT LINTER
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    au BufNewFile,BufRead *.js setlocal makeprg=gjslint\ %
    au BufNewFile,BufRead *.js setlocal errorformat=%-P-----\ FILE\ \ :\ \ %f\ -----,Line\ %l\\,\ E:%n:\ %m,%-Q,%-GFound\ %s,%-GSome\ %s,%-Gfixjsstyles%s,%-Gscript\ can\ %s,%-G

    " SAVE FILES WHEN VIM LOSES FOCUS
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    au FocusLost *.htm*,*.js,*.css,*.php :wa

endif

" }}}

" KEY MAPPINGS {{{
" Turn off print, I never use it.
map <D-p> <Nop>
map! <D-p> <Nop>

" Shortcut for square brackets "
onoremap id i[
onoremap ad a[

" Toggle paste mode quickly
nnoremap <localleader>pp :set invpaste paste?<CR>

" Next ()
vnoremap <silent> inb :<C-U>normal! f(vib<cr>
onoremap <silent> inb :<C-U>normal! f(vib<cr>
vnoremap <silent> anb :<C-U>normal! f(vab<cr>
onoremap <silent> anb :<C-U>normal! f(vab<cr>
vnoremap <silent> in( :<C-U>normal! f(vi(<cr>
onoremap <silent> in( :<C-U>normal! f(vi(<cr>
vnoremap <silent> an( :<C-U>normal! f(va(<cr>
onoremap <silent> an( :<C-U>normal! f(va(<cr>

" Next {}
vnoremap <silent> inB :<C-U>normal! f{viB<cr>
onoremap <silent> inB :<C-U>normal! f{viB<cr>
vnoremap <silent> anB :<C-U>normal! f{vaB<cr>
onoremap <silent> anB :<C-U>normal! f{vaB<cr>
vnoremap <silent> in{ :<C-U>normal! f{vi{<cr>
onoremap <silent> in{ :<C-U>normal! f{vi{<cr>
vnoremap <silent> an{ :<C-U>normal! f{va{<cr>
onoremap <silent> an{ :<C-U>normal! f{va{<cr>

" Next []
vnoremap <silent> ind :<C-U>normal! f[vi[<cr>
onoremap <silent> ind :<C-U>normal! f[vi[<cr>
vnoremap <silent> and :<C-U>normal! f[va[<cr>
onoremap <silent> and :<C-U>normal! f[va[<cr>
vnoremap <silent> in[ :<C-U>normal! f[vi[<cr>
onoremap <silent> in[ :<C-U>normal! f[vi[<cr>
vnoremap <silent> an[ :<C-U>normal! f[va[<cr>
onoremap <silent> an[ :<C-U>normal! f[va[<cr>

" Next <>
vnoremap <silent> in< :<C-U>normal! f<vi<<cr>
onoremap <silent> in< :<C-U>normal! f<vi<<cr>
vnoremap <silent> an< :<C-U>normal! f<va<<cr>
onoremap <silent> an< :<C-U>normal! f<va<<cr>

" Next ''
vnoremap <silent> in' :<C-U>normal! f'vi'<cr>
onoremap <silent> in' :<C-U>normal! f'vi'<cr>
vnoremap <silent> an' :<C-U>normal! f'va'<cr>
onoremap <silent> an' :<C-U>normal! f'va'<cr>

" Next ""
vnoremap <silent> in" :<C-U>normal! f"vi"<cr>
onoremap <silent> in" :<C-U>normal! f"vi"<cr>
vnoremap <silent> an" :<C-U>normal! f"va"<cr>
onoremap <silent> an" :<C-U>normal! f"va"<cr>

" CD to directory of current file
map <Leader>cd :cd %:p:h<CR>

" Grep/QuickFix window bindings
map <Leader>c :botright cw 10<CR>

" Don't move around in Insert mode
inoremap <Left> <Esc><Right><Left>
inoremap <Right> <Esc><Right><Right>
inoremap <Up> <Esc><Up>
inoremap <Down> <Esc><Down>

" Easily move chunks of text
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" Mac OS X/Safari keybindings for tabs
nmap <D-{> :tabprevious<CR>
nmap <D-}> :tabnext<CR>
map <D-{> :tabprevious<CR>
map <D-}> :tabnext<CR>
imap <D-{> <Esc>:tabprevious<CR>i
imap <D-}> <Esc>:tabnext<CR>i
nmap <D-t> :tabnew<CR>
imap <D-t> <Esc>:tabnew<CR>

" Bind Command-arrow/movement to move between windows
map <D-J> <C-W>j
map <D-S-Down> <C-W>j
map <D-K> <C-W>k
map <D-S-Up> <C-W>k
map <D-H> <C-W>h
map <D-S-Left> <C-W>h
map <D-L> <C-W>l
map <D-S-Right> <C-W>l

map <D-0> <C-W>= " make Command-0 equal windows

nnoremap <leader>w <C-w>v<C-w>l

" If I forgot to sudo a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %

" Don't use Ex mode, use Q for formatting
nmap Q gq

" Turn hidden characters on/off
nmap <silent> <leader>s :set nolist!<CR>

" Up/down go visually instead of by physical lines
" Interactive ones need to check whether we're in the autocomplete popup
map <up> gk
"inoremap <up> <C-R>=pumvisible() ? "\<lt>up>" : "\<lt>C-o>gk"<Enter>
map <down> gj
"inoremap <down> <C-R>=pumvisible() ? "\<lt>down>" : "\<lt>C-o>gj"<Enter>

" Map normal mode Enter to add a new line before the current one
nmap <Enter> O<Esc>

" Makes ; work for :
nnoremap ; :

" Makes W send w when it's a command
command! W w

" Deactivate the default F1 behavior of launching VIM help.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" bind command-]/command-[ to act like TextMate
nmap <D-]> >>
nmap <D-[> <<
vmap <D-]> >gv
vmap <D-[> <gv

" Toggle search highlight
nnoremap <silent> \ :silent :set invhlsearch<CR>:set hlsearch?<CR>

" Folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
" set <space> to toggle folds in normal & visual modes
nnoremap <space> za
vnoremap <space> zf

" Searching
nmap n nzzzv
nmap N Nzzzv
nmap * *zzzv
nmap # #zzzv
nmap g* g*zzzv
nmap g# g#zzzv

" Mappings for cope
nmap <leader>cc :botright cope<CR>
nmap <leader>n :cn<CR>
nmap <leader>p :cp<CR>
nmap <leader>ll :ll<CR>

" Mapping for tabs/buffers
nmap gz :bdelete<CR>
nmap gb :bnext<CR>
nmap gB :bprev<CR>
nmap <leader>reset :0,3000bd<CR>

" Sort CSS files alphabetically
nmap sort :g#\({\n\)\@<=#.,/}/sort<CR>

" Make <leader>ft fold an HTML tag
nnoremap <leader>ft Vatzf

" Sort CSS properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Reselect just-pasted text
nnoremap <leader>v V`]

" In addition to <esc>, jj will exit to normal mode.
inoremap jj <ESC>

" Launch Ack quicker
nnoremap <leader>a :Ack
" }}}

" YANKRING {{{
let g:ycm_key_detailed_diagnostics = ''
let g:yankring_replace_n_pkey = '<m-p>'
" }}}

" BUTANE {{{
noremap <leader>bd :Bclose<CR>      " Close the buffer.
" }}}

" BUFFERGATOR {{{
let g:buffergator_viewport_split_policy="T"
let g:buffergator_split_size=10
" }}}

" CtrlP {{{
let g:ctrlp_map = "<c-p>"
let g:ctrlp_cmd = "CtrlPMixed"
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$',
\ 'file': '\.pyc$',
\ }
let g:ctrlp_working_path_mode = "ra"
let g:ctrlp_open_new_file = "r"
let g:ctrlp_open_multiple_files = "i"
" }}}

" POWERLINE {{{
let g:Powerline_symbols = "fancy"
" }}}

" GUNDO {{{
nnoremap <F4> :GundoToggle<CR>
" }}}

" PYDICTION {{{
let g:pydiction_location = "~/.vim/bundle/pydiction/complete-dict"
" }}}

" MATCHIT {{{
runtime plugins/matchit.vim
let b:match_ignorecase = 1
" }}}

" NETRW {{{
" Default to tree view
let g:netrw_lifestyle = 3
" hide common hidden files
let g:netrw_list_hide = '.*\.py[co]$,\.git$,\.swp$'
" Don't use fricken elinks, wtf
let g:netrw_http_cmd = "wget -q -O" " or 'curl -Ls -o'
let g:netrw_winsize = 10
let g:netrw_alto = 1
" }}}

" EASYTAGS {{{
let g:easytags_resolve_links = 1
let g:easytags_cmd = '/usr/local/bin/ctags'
" }}}

" TAGLIST {{{
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 0
let Tlist_Enable_Fold_Column = 0
let Tlist_Compact_Format = 1
let Tlist_WinWidth = 40
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Sort_Type = 'name'
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Show_Menu = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Auto_Update = 1
let Tlist_Show_One_File = 1
let g:tlist_javascript_settings = 'js;javascript;s:string;a:array;o:object;f:function'
" }}}

" RAGTAG {{{
inoremap <M-o> <Esc>o
inoremap <C-j> <Down>
let g:ragtag_global_maps = 1
" }}}

" NERD_TREE {{{
nmap <Leader>d :NERDTreeFind<CR>
let g:NERDChristmasTree = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = 'right'
let g:NERDTreeWinSize = 30
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoCenter = 1
let g:NERDTreeIgnore = ['\.git$', '\.svn$', '\.jpg$', '\.gif$', '\.png$', '\.pyc', '\.DS_Store']
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeSortOrder = ['\/$', '*']
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeMinimalUI = 1
" }}}

" VimFiler {{{
let g:vimfiler_enable_auto_cd = 1
let g:loaded_netrwPlugin = 1
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
" }}}

" YANKRING {{{
nnoremap <silent> <F3> :YRShow<CR>
inoremap <silent> <F3> <ESC>:YRShow<CR>
"
" skip all single-letter deletes (x)
let g:yankring_min_element_length = 2
"
" save last 50 items in history, only show last 50 in window
let g:yankring_max_history = 50
let g:yankring_max_display = 50
"
" save yankring entries across vim instances
let g:yankring_persist = 1
let g:yankring_share_between_instances = 1
"
" don't save duplicates
let g:yankring_ignore_duplicate = 1

" use a separate vertical split window that auto-closes and
" is 30 chars wide on the right side
let g:yankring_window_use_separate = 1
let g:yankring_window_use_horiz = 0
let g:yankring_window_auto_close = 1
let g:yankring_window_width = 50
let g:yankring_window_use_right = 1

" pressing <space> will increase the size of the window by 15 columns
let g:yankring_window_increment = 15

" have yankring manage Vim's numbered registers ("0-"9)
let g:yankring_manage_numbered_reg = 1

" keep the history file in the $HOME/.vim folder instead of $HOME
let g:yankring_history_dir = '$HOME/.vim'

" yankring keeps an eye on the clipboard
let g:yankring_clipboard_monitor = 1

" if something changes the default register without going through
" yankring, use the default register value rather than the top item in
" yankring's history
let g:yankring_paste_check_default_buffer = 1
" }}}

" FLAKE8 {{{
let g:flake8_cmd = '/usr/local/bin/flake8'
let g:flake8_cmd = '/usr/local/bin/pyflakes'
" }}}

" SYNTASTIC {{{
" use signs to indicate lines with errors
" only if signs are available
if has('signs')
    let g:syntastic_enable_signs = 1
endif
"let g:syntastic_enable_signs = 1

" automatically open the location list when a buffer has errors
let g:syntastic_auto_loc_list = 1

" always show warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}

" ignore djangohtml
let g:syntastic_disabled_filetypes = ['htmldjango', 'txt', 'text', 'tumblr', 'css', 'html5', 'htmldjango.html']

let g:syntastic_auto_jump = 1

let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

let g:syntastic_python_checkers = ['pyflakes']
" }}}

" ARGUMENT REWRAP {{{
nnoremap <silent> <leader>ar :call argumentrewrap#RewrapArguments()<CR>
" }}}

" PyMode {{{
let g:pymode_lint = 0
let g:pymode_breakpoint_key = '<leader>e'
let g:pymode_rope = 0
" }}}

" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_enable_branch = 1
let g:airline_enable_syntastic = 0
let g:airline_detect_paste = 1
let g:airline_detect_modified = 1
let g:airline_section_b = '%{fugitive#statusline()}'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#hunks#enabled = 0
" }}}

" SuperTab {{{
let g:SuperTabDefaultCompletionType = '<c-n>'
" }}}

" Bufferline {{{
let g:bufferline_echo=0
let g:bufferline_fname_mod = ':.'
" }}}

" Jedi {{{
let g:jedi#get_definition_command = '<leader>def'
" }}}

" TagBar {{{
nmap <F2> :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_left = 1 " make tagbar open on the left
" }}}

" FUNCTIONS {{{

" HIGHLIGHT LONG LINES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=? HighlightLongLines call s:HighlightLongLines('<args>')
function! s:HighlightLongLines(width)
    let targetWidth = a:width != '' ? a:width : 79
    if targetWidth > 0
        exec 'match Error /\%>' . (targetWidth) . 'v/'
    else
        echomsg "Usage: HighlightLongLines [natural number]"
    endif
endfunction
nmap <leader>h :HighlightLongLines<CR>

" SEARCH FOR VISUAL SELECTION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" STAB: SET TABSTOPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    call SummarizeTabs()
endfunction

function! SummarizeTabs()
    try
        echohl ModeMsg
        echon 'tabstop='.&l:ts
        echon ' shiftwidth='.&l:sw
        echon ' softtabstop='.&l:sts
        if &l:et
            echon ' expandtab'
        else
            echon ' noexpandtab'
        end
    finally
        echohl None
    endtry
endfunction

" STRIP TRAILING WHITESPACE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" DISPLAY OUTPUT OF SHELL COMMANDS IN SCRATCH BUFFER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  silent execute '$read !'. expanded_cmdline
  1
endfunction

func! Cwd()
    let cwd = getcwd()
    return "e " . cwd
endfunc

func! DeleteTilSlash()
    let g:cmd = getcmdline()
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    if g:cmd == g:cmd_edited
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    endif
    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

func! CurDir()
    let curdir = substitute(getcwd(), '/Users/kennethlove', "~/", "g")
    return curdir
endfunc
"
" return '[mixed]' if spaces and tabs are used to indent
" return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning = '[mixed]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

" return '[\s]' if trailing white space is detected
" return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        let tabs = search('\t\+$', 'nw') != 0
        let spaces = search('\s\+$', 'nw') != 0
        if tabs || spaces
            let b:statusline_trailing_spaces_warning = '[\s]'
        else
            let b:statusline_trailing_spaces_warning = ''
        endif
    endif
    return b:statusline_trailing_spaces_warning
endfunction

" return a warning for 'long lines' where 'long' is either &textwidth
" or 80 (if no &textwidth is set)
"
" return '' if no long lines
" return '[#x, my, $z]' if long lines are found, where 'x' is the number
" of long lines, 'y' is the median length of the long lines, and 'z' is
" the length of the longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")
        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                \ '#' . len(long_line_lens) . ", " .
                \ 'm' . s:Median(long_line_lens) . ", " .
                \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ''
        endif
    endif
    return b:statusline_long_line_warning
endfunction

" return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)

    let long_line_lens = []

    let i = 1
    while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile

    return long_line_lens
endfunction

" find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction
" }}}

" MISCELLANEOUS {{{
" This beauty remembers where you were the last time you edited the file, and 
" returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

nmap <F3> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

nnoremap U :syntax sync fromstart<CR>:redraw!<CR>

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
" }}}
