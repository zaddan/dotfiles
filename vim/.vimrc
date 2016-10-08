filetype on 
filetype plugin on
filetype indent on
""""""""""""""""""""""""""
"how to"
""""""""""""""""""""""""""
"learning how to map"
":nmap - Display normal mode maps
":imap - Display insert mode maps
":vmap - Display visual and select mode maps
":smap - Display select mode maps
":xmap - Display visual mode maps
":cmap - Display command-line mode maps
":omap - Display operator pending mode maps"
"example:
":imap jj <Esc>

"behzad stuff
"map <SPACE> <Plug>(easymotion-s2)
"the followig plug in didn't work proplerly, so I uninstalled it"
"let g:RangeMacro_Mapping = '<Leader>@' 

"easy motion
nmap rr <Plug>(easymotion-s2)
"end of easy motion
"plugins
"function ER()
    "let @/ = "thisregisterissettothisvaluesforevertoavoidsearchreplaceanomalisinthecaseofjj"
"endfunction
"the following is used for repeating commands

":nnoremap <S-w> w 
":nnoremap w <S-w>
":nnoremap b <S-b>
":nnoremap <S-b> b 
"Pathogen Plugin
execute pathogen#infect()
call pathogen#helptags()
"generate helptags for everything in ‘runtimepath’

"syntastic Plugin
"inorder to open and close the error window use :lopen and :lclose
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0 "if 1, the error window always there
let g:syntastic_check_on_wq = 0"
let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": ["ruby", "php"],
        \ "passive_filetypes": [""] }


"others tuff
"folding stuff
"set foldmethod=indent
"set foldlevel=3
"set foldclose=all
" Folding
" zf: fold selection
" zo: open fold
" zc: close fold
" za: toggle folding
" zm: fold one level
" zM: fold everything
" zr: unfold one level
" zR: unfold everythingiiiii

"setting up the line number 
:set number

"set wrap
"setting the tw and wm
:set tw=200
":set wm=2
"set formatoptions=qrn1
set formatoptions=tcqrj


" to draw a line in 80 character"
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(400,999),",")
let &co=100 + &foldcolumn + (&number || &relativenumber ? &numberwidth : 0)

nnoremap da d$ 

"
"end of behzad stuff
" Change the  Key To Something Easier
let mapleader=","

" Plugin: Align
" Select in visual mode (shift )
" Then type :Align = (where = is the seperator of choice)

" Plugin: SnipMate
" ----------------
" Edit .vim/snippets/filetype.snippet
" Then inside vim, enter keyword then tab
" To do normal auto completion, do ctrl-n

" Plugin: YankRing
" ----------------
" After a paste, press ctrl-p to cycle through last pastes
let g:yankring_history_dir = '~/.vim/temp'
let g:yankring_clipboard_monitor = 1
let g:yankring_zap_keys = 'f F t T / ?'
" Also allows pasting between windows

" Plugin: MRU
" -----------
" ,f shows MRU
let MRU_Max_Entries = 400
nmap <leader>f :MRU<CR>


" Plugin: Fugitive
" ----------------
" Git:
" :Git _____ lets you run anything
" But try not to use
" eg. :Git log shows the log
" Aliases, completion is also handled correctly

" Status: 
" :Gstatus
" git status
nmap <leader>gs :Gstatus<cr>
    " Press "Enter" to open the file in the window below
    " Then run Gdiff
    " Then use "-" to stage it/remove it
    " Press "p" to add parts of a file
    " Press "shift-c" to commit

" Old Versions:
" :Glog
" run ,gl, then use these [q and ]q to move through
" then ,ge to return to the top
nmap <leader>gl :Glog<cr>
nmap [q :cprev<cr>
nmap ]q :cnext<cr>
nmap [Q :cfirst<cr>
nmap ]Q :clast<cr>
nmap <leader>ge :Gedit<cr>

" Other Branches:
" Edit files in any branch:
" :Gedit branchname:filename
" eg. :Gedit master:.vimrc
" :Gvsplit

" Search:
" :Ggrep findme
" :Ggrep findme branchnam
" Find something taken out during acommit
" :Glog -S findme --

" Explore:
" :Gedit HEAD^ (replace HEAD with a specific SHA if desired)
" Press enter on the tree line to see all files in that commit
" Press enter on the parent line to go to the parent commit
" To go back to the top, 
" :Gedit if get stuck
nmap <leader>gx :Gedit HEAD^<cr>
" To go back, use ,gu if inside file tree, Shift-C to go to commit version
nmap <leader>gu :edit %:h<CR> 

" Commit:
" :Gcommit
" git commit
" Put commit message at the top of the new window
nmap <leader>gc :Gcommit<cr>

" Add:
" :Gwrite
" git add currentfile
nmap <leader>ga :Gwrite<cr>

" Remove:
" :Gremove
" git remove currentfile
nmap <leader>grm :Gremove<cr>

" Move:
" :Gmove targetpath (relative to current file location)
" git mv originalpath destinationpath
" / is the root of the repo, not the filesystem
nmap <leader>gm :Gmove<cr>

" Revert:
" :Gread
" git checkout currentfile
nmap <leader>gre :Gread<cr>

" Blame:
" :Gblame
" git blame
nmap <leader>gb :Gblame<cr>

" Log:
" :Glob
" git log
nmap <leader>gl :Glog<cr>

" Diff:
" :Gdiff
" git diff
" Current (working) on the right, what will be committed (stage) on the left
" :diffget on oneside will move to the other
" :do (diffobtain)
" :diffupdate to update colors
" If do on a merge conflict file, 
" left: target (probably master)
" middle: working copy (if we just opened it in an editor)
" right: merge branch (what we tried to merge in)
nmap <leader>gd :Gdiff<cr>



" Plugin: NerdCommenter
" ---------------------
" ,c<space> toggles
" ,cs better comment
" ,cc comments selected
" ,cu uncomments selected

" Plugin: Cream-capatilize
" ------------------------
nmap <leader>C 0v$<f5><esc>

" Plugin: Scratch
" ---------------
" ,<tab> will open a scratch window
nmap <leader><tab> :Sscratch<cr>

" Plugin: Command-t
" -----------------
" ,t starts command t
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc

" Plugin: Slime
" -------------
" screen -S sessionname in another window
" Ctrl-c-c to send to this (need to enter sessionname)
" By default sends the current paragraph, can use visual mode
" to send something else
" Ctrl-c v reprompts to reattach to a new session
"

" Plugin: LargeFile
" -----------------
" Makes reading large files easier


" Plugin: ACK
" -----------
" To do an ACK search
" ,a to do an ack search
" :Ack pattern
" To learn more
" :h Ack
" Be careful if not in the right directory
" ..need to use ,cd
" Use Ctrl-P to paste path of current directory
" t opens in a new tab
" T opens in a background tab
" o opoens
" q closes
" go previews
noremap <leader>a :Ack 

" ,cd will switch to the directory of the open buffer
nmap <leader>cd :cd %:p:h<cr>


" Plugin: Nerdtree
" ----------------
" ,t opens it
" t opens in a new tab
" o opens file
" s opens in new vertical
" p to go to parent
" r to refresh
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"
nmap <Leader>d :NERDTreeToggle<CR>


"  shortcuts
" ----------------

" ctrl-n does autocompletion

" Open this file more easily 
" ,ev to edit .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

" Vertical split then hop to new buffer
" ,v to create a new vertical split
:nnoremap <Leader>v :vsplit 

" Horizontal split
" ,h to create a new horizontal split
":nnoremap <Leader>h :split 
:nnoremap <leader>f :split 
" ,, moves between buffers
nmap <Leader>, <C-W>W

" Make forward and back easier
" Shift-j to move a page down
" Shift-k to move a page up
nmap <S-j> <C-F>
nmap <S-k> <C-B>

" Move cursor within screen
" H moves to top
" M moves to middle
" B moves to bottom
" fx moves to next occurance of x
" tx moves to right before next occurance of x
" Fx moves to last occurance of x

" ,yf to copy filename to gnome clipboard
nmap ,yf :let @*=expand("%")<CR>

" ,yp to copy filename+path to gnome clipboard
nmap ,yp :let @+=expand("%:p")<CR>

" ,9 creates an underline for a comment
nnoremap <leader>9 yypllv$r-

" ,1 makes a markdown header1
nnoremap <leader>1 yypv$r=

" ,2 makes a markdown header2
nnoremap <leader>2 yypv$r-

" ,i makes an indent
nnoremap <leader>i i*<space>

" ,e opens an edit command with the path of the currently edited file filled in
nmap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" ,t opens a tab edit command with the path of the currently edited file filled in
nmap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" ,s opens the snippet directory
"nnoremap <leader>s <C-w><C-v><C-w><C-w><C-l>:e ~/dotfiles/.vim/bundle/snipMate/snippets/<cr>

" ctrl-p inserts the path of the currently edited file into a command
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Use tab to look between bracket pairs
nnoremap <tab> %
vnoremap <tab> %
vnoremap <Leader>m :normal @

" Tab configuration
" ,tn makes a new tab
nmap <leader>tn :tabnew<cr>
" ,te edits a file in a new tab
nmap <leader>te :tabedit

" 0 moves to beginning of line after tabs, not absolute beginning
nmap 0 ^

" just type xdate
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" ]p will paste with the same level of indent as the line above

" m <letter> will mark a section
" ` <letter> (backtick will return)
" `. goes to last edited line

" ,/ to clear highlights
nnoremap <leader>/ :noh<cr>

" Tab hotkeys
" ctrl-h to move to the left
" ctrl-l to move to the right
nmap <C-h> :tabprev<CR>
nmap <C-l> :tabnext<CR>

" Move between split panes
nmap <S-h> <C-W>h
nmap <S-l> <C-W>l
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k

" Hide comments in 
nmap <leader>c :setlocal foldmethod=syntax<CR>

" ,w writes
nnoremap <Leader>w :w<CR>
" ,q quits
nnoremap <Leader>q :q<CR>
" ,x writes and quits
:nnoremap <leader>zz :q!<Enter>
:nnoremap <leader>q :wq!<Enter>
:nnoremap <leader>w :w<Enter>
:nnoremap <leader><leader> <C-W><C-W>
" ,z just quit without writing


nnoremap <Leader>x :wq!<CR>

" ,p toggles paste mode to turn off weird wrapping/commenting
set pastetoggle=<leader>p
nmap <leader>p :set invpaste paste?<CR>

" Run make with ,m
"nmap <leader>m :!make<CR><CR>
" ,W clears whitespacewn
noremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" In command mode, enter inserts a newline,
" Shift-enter inserts above
"nmap <S-Enter> O<ESC>
nmap <Enter> o<ESC>

" ,v reselects just pasted text
nnoremap <leader>r V`]

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>M mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Vim settings
" ------------

" Turn off vi compatability
set nocompatible 

" Turn on syntax highlighting
syntax on

" Turn regex to perl/python style
" Known as 'very magic' and it means
" that only digits and numbers are literals
" and everything else has a special meaning
"
"nnoremap / /\v
"vnoremap / /\v
"cnoremap %s/ %s/\v

" Turn on auto indentation
set autoindent

" Encodeing
set encoding=utf-8

" Show number of lines of selection
set showcmd

" Always show 3 lines when at the bottom of a file
set scrolloff=3

" Automatically reload a file when changed from the outside
set autoread

" Highlight the background of the entire line where the cursor is
set cursorline

" Should be on automatically, but just in case
set ttyfast

" Show the current line position
set ruler

" Allow backspace over anything
set backspace=indent,eol,start

" Always show a status line
set laststatus=2

" Ignore case while searching
set smartcase

" Show matching bracket when over one of them
set showmatch

" Show trailing whitespace
set listchars=tab:\▸\ ,trail:·

" Shortcut to rapidly toggle `set list`
" ,l shows invisible characters
nmap <leader>l :set list!<CR>
" Toggle spell checking
nmap <Leader>zs :set spell!<CR>

" Turn off backup (trust me to do it correctly)
set nobackup
set nowb
set noswapfile

" Set up persistent undo
" Only works in 7.3
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry


" Start scrolling three lines before horizontal border of window.
set scrolloff=3

" When buffer brought foreground, remember undo
set hidden 

" Searching
" Highlight dynamically as pattern is typed
set incsearch 
" Enable search highlighting
set hlsearch 

" Don't need /g for replaces
set gdefault

" Show filename in window title
set title

" Make split windows the same width always
set equalalways

" Turn off beeping
set visualbell

" Better command line comletion
set wildmenu 
set wildmode=list:longest

" Keep command line history
set history=1000

" Setup copy/paste
" Mirror vim clipboard (eg. yank), with system clipboard
"set clipboard=unnamed
"source $VIMRUNTIME/mswin.vim
"behave mswin

" Allow for mouse movement in vim
if has('mouse')
    set mouse=a 
endif

" Long lines
"set wrap
"set wm=2
"set textwidth=79
"set formatoptions=qrn1
"set formatoptions=tcqrj
" Selecting then "gq" will wrap selection

" A tab is 2 spaces
set tabstop=4 
set shiftwidth=4
set expandtab
" type :retab to expand all of these
" type ctrl-v tab to get a real tab (,l to show it)

" Colors
" If using an 8 bit terminal colors will not work, need to
" reset the color scheme
let &t_Co=256

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\   " Filename
    set statusline+=%w%h%m%r " Options
    "set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif


"set guifont=Bitstream\ Vera\ Sans\ Mono\ 10


""added by behzad boroujerdian
""----------------------------
""----------------------------


:nnoremap k gk
:nnoremap j gj

"for adding a print statement in python
:nnoremap pw lbywoprint "<Esc>p<S-A>: " + str(<Esc>p<S-A>)<Esc>j0
:nnoremap aa ^
:nnoremap mm $
":nnoremap gb ^
:nnoremap de d$

""remappnig the escape
:imap ij <Esc>
:cmap ij <Esc><Esc>
:smap ij <Esc>
:vmap ij <Esc>
:onoremap  ij <Esc>
"search under the cursor
:nnoremap // <S-*>

""-----every thing necessary for search and replace---
:nnoremap <Leader>s :%s/
""search and replace with auto completion
":nnoremap 's :%s/<C-f>i
""search and completion for the word under the cursor
:nnoremap <Leader>ss :%s/\<<C-r><C-w>\>/
""for abolish plug-in
:nnoremap <Leader>S :%S/

:vnoremap <Leader>s :s/
""search and replace with auto completion
:vnoremap 's :s/<C-f>i
""search and completion for the word under the cursor
:vnoremap <Leader>ss :s/\<<C-r><C-w>\>/
""for abolish plug-in
:vnoremap <Leader>S :S/
""----------------------------
""----------------------------
:fixdel
":set backspace=2 

"mapping the arrow keys
:imap <C-h> <Left>
:imap <C-j> <Down>
:imap <C-k> <Up>
:imap <C-l> <Right>
"if you activate set paste, then the auto indenting doesn't work properly
":set paste

",i makes an indent
nnoremap <leader>i i<space>
":set t_kb=CTRL-i
"""""""""""""""""""""""""""""""""""""""""""""""my changes"
"set shellcmdflag=-ic
"location of the progress files. These files contain information about 2 main
"things: 1.progress: keep track of the progress  that I have been making on
"ceratin issues. 2.to do list. what needs to be done
" size of a hard tabstop

"prog1: info regarding work life
nmap gt :vsplit ~/behzad_local/personal/todo.txt <Enter>
nmap gp :vsplit ~/behzad_local/personal/live_better_problems.txt <Enter>
nmap gh :vsplit ~/behzad_local/personal/live_better_hyp.txt <Enter>
nmap gs :vsplit ~/behzad_local/personal/live_better_solutions.txt <Enter>
nmap gb :vsplit ~/behzad_local/personal/habitualize.txt <Enter>
nmap gx :vsplit ~/behzad_local/personal/habitualize.txt <Enter>


"prog2: info regarding home,outside life (other things)
nmap sc :vsplit ~/scratch <Enter>
nmap prog2 :vsplit /nfs/pdx/home/bborouje/monitoring/progress_others.txt

",t makes a tab both in normal and visual mode
"nnoremap <leader>t i<tab><ESC>j^
nnoremap <C-o> <ESC> 


"ctrl+i instead of <ESC>
"inoremap <C-i> <ESC>

"copy to the terminal buffer
"copy a line
nnoremap <C-c> v$h"*y
"copy a word 
"nnoremap <C-c><C-w> v$h"*w
"copy in visual mode 
vnoremap <C-c> "*y


"typing space in normal mode will add space the line in C
:nnoremap space ^v$:s/^/  <Enter>j^
:vnoremap space :s/^/  /<Enter>j^


":nnoremap mls ^i"<Esc><S-A>" 
":nnoremap ms <Esc>bi"<Esc>ei" 

"typing pyco in normal mode will comment the line in python
"typing cco in normal mode will comment the line in C
:nnoremap pyco ^v$:s/^/# <Enter>j^
:nnoremap cco ^v$:s/^/\/\/ <Enter>j^


"uncommenting"
:nnoremap qcco ^xx/<Enter>j^
:nnoremap qpyco ^xx/<Enter>j^
"typing pyco in visual mode will comment the line in python
"typing cco in visual mode will comment the line in C
:vnoremap pyco :s/^/#<Enter>j^
:vnoremap cco :s/^/\/\/<Enter>j^

:vnoremap qpyco :s/^.//<Enter>:s/^/.//<Enter>j^
:vnoremap qcco :s/^..//<Enter>j^



:nnoremap ss :split scratch.txt <Enter>

"tabing"
:vnoremap tb :s/^/  <Enter>j^ 
:vnoremap ttb :s/^/         <Enter>j^
:vnoremap tttb :s/^/            <Enter>j^




"pulling up .bashrc"
""":nnoremap bashrc :vsplit ~/.bashrc

"pulling up .vimrc"
:nnoremap vimrc :vsplit ~/.vimrc <Enter>

:nnoremap viml :vsplit ~/vim_collection/learningVim <Enter>

:nnoremap viml :vsplit ~/vim_collection/learningVim <Enter>

"
"description for a function or class in c"
:nnoremap desc ^i/*****************************************<Enter>function_name: <Enter>description: <Enter>Usage: <Enter>*****************************************/<Esc>j^

"description for a function or class in python"
:nnoremap desp ^i########################################<Enter>#function_name: <Enter>description: <Enter>#Usage: <Enter>#########################################<Esc>j^

"writing tests"
"in C"
:nnoremap testc ^i//*******testnumber: <Enter>*******test_description: <Esc>j^
"in pythong"
:nnoremap testpy ^i#*******testnumber: <Enter>#*******test_description: <Esc>j^

"drawing a line"
"   drawing a line in C"
:nnoremap cline ^i//-----------------------------------------------------------------<ESC>j^
"   drawing a line in python"
:nnoremap pyline ^i#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<ESC>j^


"great for doc in python
:nnoremap pydoc ^i#=============================<ESC>j^ 

"------------python helpers"
"used to explain a function"
"used before the function header"
:nnoremap modhead ^i#-----------------------------------------------------------------------------------------------------------------------------<Enter>#-----------------------------------------------------------------------------------------------------------------------------<Enter>#---------module_name:::<Enter>#---------functionlity:::<Enter>#-----------------------------------------------------------------------------------------------------------------------------<Enter>#-----------------------------------------------------------------------------------------------------------------------------<ESC>kkk<S-A>

"guides: for further explanations
"no tab"
"":nnoremap guide ^00d$i# ----::: <ESC><S-A>
":nnoremap guide ^i<Enter><ESC>k0i#---------guide::: <ESC><S-A>
"one tab"
":nnoremap tguide ^00d$i<S-tab>#---------guide::: <ESC><S-A>
""two tabs"
":nnoremap ttguide ^00d$i<S-tab><S-tab>#---------guide::: <ESC><S-A>
"
"
":nnoremap tgguide ^00d$i<S-tab>#---------------- <ESC><S-A>
""two tabs"
":nnoremap ttgguide ^00d$i<S-tab><S-tab>#---------------- <ESC><S-A>
"
":nnoremap fguide ^00d$i#----------------- <Enter>#---------guide::: <Enter>#---
"-------------- <ESC>k<S-A>
:nnoremap tfguide ^00d$i<S-tab>#----------------- <Enter>#---------guide::: <Enter>#----------------- <ESC>k<S-A>

:nnoremap guide <S-o># ---- <ESC><S-A>
":nnoremap wg i<Enter># ---- <ESC><S-A>
:nnoremap fguide <S-o># ----<Enter># ----<Enter>  # ----<ESC> <S-A>

:nnoremap cguide <S-o>// ---- <ESC><S-A>
":nnoremap wg i<Enter># ---- <ESC><S-A>
:nnoremap cfguide <S-o>// ----<Enter>// ----<Enter>  // ----<ESC> <S-A>


:nnoremap cdis ^i//**--------------------**<Enter>**--------------------**<Enter>----disclaimers:::<Enter>**--------------------**<Enter>--------------------**<ESC>kkk<S-A>

:nnoremap pydis ^i#**--------------------**<Enter>#**--------------------**<Enter>#----disclaimers:::<Enter>#**--------------------**<Enter>#--------------------**<ESC>kkk<S-A>

:nnoremap pytodo ^i#**--------------------**<Enter>#**--------------------**<Enter>#----todo:::<Enter>#**--------------------**<Enter>#--------------------**<ESC>kkk<S-A>


"

"------------c helpers"
"used to explain a function"
"used before the function header"
:nnoremap cmodhead ^i//----------------------------------------------------<Enter>//----------------------------------------------------<Enter>//---------module_name:::<Enter>//---------functionlity:::<Enter>//----------------------------------------------------<Enter>//----------------------------------------------------

"guides: for further explanations
"no tab"
":nnoremap cguide ^i//---------guide::: <ESC><S-A>
""one tab"
":nnoremap ctguide ^i<S-tab>//---------guide::: <ESC><S-A>
""two tabs"
":nnoremap cttguide ^i<S-tab><S-tab>//---------guide::: <ESC><S-A>

":nnoremap pyguide ^i#---------guide::: <ESC><S-A>
""one tab"
":nnoremap pytguide ^i<S-tab>#---------guide::: <ESC><S-A>
""two tabs"
":nnoremap pyttguide ^i<S-tab><S-tab>#---------guide::: <ESC><S-A>







"notes: for further explanations
"no tab"
"one tab"
:nnoremap tnote ^i<S-tab>#---------note::: <ESC><S-A>
"two tabs"
:nnoremap ttnote ^i<S-tab><S-tab>#---------note::: <ESC><S-A>

"examples: for further explanations
"no tab"
""":nnoremap example ^i#---------example::: <ESC><S-A>
"one tab"
""":nnoremap texample ^i<S-tab>#---------example::: <ESC><S-A>
"two tabs"
""":nnoremap ttexample ^i<S-tab><S-tab>#---------example::: <ESC><S-A>

"stepss: for further explanations
"no tab"
:nnoremap steps ^i#---------steps::: <ESC><S-A>
"one tab"
:nnoremap tsteps ^i<S-tab>#---------steps::: <ESC><S-A>
"two tabs"
:nnoremap ttsteps ^i<S-tab>#---------steps::: <ESC><S-A>

"warnings: for further explanations
"no tab"
":nnoremap warn ^i#---------warnings::: <ESC><S-A>
"one tab"
":nnoremap twarn ^i<S-tab>#---------warnings::: <ESC><S-A>
"two tabs"
":nnoremap ttwarn ^i<S-tab>#---------warnings::: <ESC><S-A>

"questions: for further explanations
"no tab"
:nnoremap question ^i#---------question::: <ESC><S-A>
"one tab"
:nnoremap tquestion ^i<S-tab>#---------question::: <ESC><S-A>
"two tabs"
:nnoremap ttquestion ^i<S-tab><S-tab>#---------question::: <ESC><S-A>



"tabularize"
:vnoremap tab= :Tab/=/<Enter>


"lesson"
"to take note of the lessons learned within the file lesson a line in C"
:nnoremap clesson ^i//***lesson: 
"to take note of the lessons learned in the lessons folder 
nnoremap clessons <C-w><C-v><C-l>:e ~/programming/C_programming/lessons/clessons/clessons<cr>

"   leeson a line in python"
:nnoremap pylesson ^i#***lesson: 

"to take notes of the lessons that I learn about vim
nnoremap vlessons <C-w><C-v><C-l>:e ~/vimrc/lessons<cr>


"spelling corrections"
iab teh the
iab prinft printf
iab coutner counter


",t makes a tab both in normal and visual mode (not working)
"vnoremap <leader>t :s/^/<tab><Enter>j^
":iunmap <Tab>-


"getting rid of the highlights after a search or replacement
"nnoremap <esc> :noh<return><esc>
nnoremap oh :noh<cr>

"selecting a block
nnoremap # v% 



"trying to indenet a block in the following line but not working
"nnoremap 1t v% :s/^/^I

""" end of addition by behzad boroujerdian


" Nice scrolling if line wrap
"jumping between curly braces and"
"noremap # v%  
"noremap j gj
"noremap k gk
"map \ss :ScreenShell bash<CR>
"map \s :ScreenSend<CR> 


"chaning the color slightly upon entering insert mode"
"au InsertEnter * hi Normal ctermbg=255 guibg=#e8e8e8
"au InsertLeave * hi Normal ctermbg=255guibg=#ffffff

"changing cursor shape for different modes"
"if has("autocmd")
"    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
"    au InsertEnter,InsertChange *
"                \ if v:insertmode == 'i' | 
"                \   silent execute '!echo -ne "\e[6 q"' | redraw! |
"                \ elseif v:insertmode == 'r' |
"                \   silent execute '!echo -ne "\e[4 q"' | redraw! |
"                \ endif
"    au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
"endif
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

"au FileType * setlocal formatoptions-=c formatoptions-=o


"let g:ScreenShellGnuScreenVerticalSupport = 'native'
"let g:ScreenImpl = 'Tmux'
"
"
"-----------------------------------------------------------------------------------------------------------------------some NOTES
"change the tabs equivalent of spaces  :set tabstop=4
"

set virtualedit=onemore

