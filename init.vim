"Change options so loading a session takes current vimrc configuration
set ssop-=options    "do not store global and local values in a session
set ssop-=folds      "do not store folds

"Command below to obtain the packages from my custom home folder
"set packpath=~/.vim
"set packpath=C:/Users/aholguin-ext/Downloads/Essentials/myplugins
set packpath=$MYPACKPATH

"Add custom abbreviation for documents path in each computer with windows
"cmap @@ C:\Users\holguina\Documents\

"Allow Shift+Insert key combination to work in neovim
"inoremap <silent> <S-Insert> <C-R>+
"cnoremap <silent> <S-Insert> <C-R>+

"Set leader as in gvim
let mapleader = '\'

"Set history greater than default
set history=500

"Set hidden to allow editing multiple buffers without saving each time you
"move
set hidden

"Enter new commands to work with multiple buffers
nnoremap ¿¿ :bn<CR>
nnoremap ¡¡ :bp<CR>
nnoremap çç :b#<CR>

"Command to change the current directory for the current window
"nnoremap <leader>cd lcd %:h<CR>
nnoremap <leader>cd :lcd %:h<CR>

"Allow backspace to delete indents and previously entered lines
set backspace=indent,eol,start

"Activate syntax color
syntax on

"Allow incremental search it gives a more practical highlight search
set incsearch

"Set highlight on search
set hlsearch

"Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"Add position information at screen's bottom right
set ruler

"Always activate before colorscheme
set termguicolors

"Use custom color in plugins folder
"colorscheme snow
"colorscheme PaperColor
"colorscheme iceberg
"colorscheme ayu
colorscheme stellarized

"Change font
"set guifont=Consolas:h12

"Add relative numberlines
set number
set relativenumber

"Modify number lines so relativenumber is only shown in normal mode
augroup numbertoggle
autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"Ignore case in searches and take case into account if cap is used in search
set ignorecase
set smartcase

"Ignore case when opening files or directories
set wildignorecase

"Change tab to spaces to match indentation in external programs like SAS
set tabstop=4
set shiftwidth=4
set expandtab

"Set %% to expand to folder of the current buffer in command mode (:)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"This line is added to grant compatibility with NERDComments plugin
"filetype plugin on

"Indentation
set autoindent
filetype indent on

"Change the way tab key works for path folders to use the first tab to try
"to complete until partial match, the second tab to open a list and the
"third tab to cycle through the list
set wildmenu
set wildmode=longest,list,full

"Add MRU options (plugin to save the latest edited files)
"let MRU_file = '~/_vim_mru_files'
"let MRU_Max_Entries = 1000

"Add a line to indicate the limit of 80 characters per column
"set colorcolumn=90

"Mappings to open vimrc easily and source the changes without closing session
nnoremap <leader>ev :vsplit $MYINITVI<cr>
nnoremap <leader>sv :source $MYINITVI<cr>

"Customize statusline
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
"Always show status line
set laststatus=2

"Other remaps
nnoremap <leader>a ^
nnoremap <leader>o g_
nnoremap <leader>g G
"remap to use in help page
nnoremap g] <C-]> 

"Add autocomplete symbols
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i

"Remap to put the date at the end of the line
nnoremap <leader>id A<C-R>=strftime('%d%b%Y')<CR><ESC>
nnoremap <leader>ic A/*Andrés Holguín <C-R>=strftime('%d%b%Y')<esc>*/<ESC>
"Remap to insert the date while typing
inoremap <leader>id <C-R>=strftime('%d%b%Y')<CR> 

"SAS specific remaps
"****************************************

"Enter a comment and allow to enter supplementary text
inoremap <leader>sc /*Andrés Holguín <C-R>=strftime('%d%b%Y')<CR>*/<esc>bi
nnoremap <leader>sc A /*Andrés Holguín <C-R>=strftime('%d%b%Y')<CR>*/<esc>bi

"Enter a basic sql step
inoremap <leader>sql proc sql;<cr>create table changethis as<cr>select *<cr>from changethis<cr>where changethis<cr>group by changethis<cr>order by changethis<cr>;<cr><esc>Iquit;<esc>{/changethis<cr>
iabbrev sql sql;<cr>create table changethis as<cr>select *<cr>from changethis<cr>where changethis<cr>group by changethis<cr>order by changethis<cr>;<cr><esc>Iquit;<esc>{/changethis<cr>

"DBV-Tech particular config
"****************************************
"Command to change fileencoding as utf-8 causes issues with specialcharacters
"in SAS 
"augroup encoding_sas
   "autocmd!
   ""autocmd BufWrite *.sas :set fileencoding=latin1
   "autocmd BufWrite *.sas :set fileencoding=utf-8
"augroup END

cabbrev z: \\192.168.155.33\sasdata\

"Add here temporary abbreviations for work
"cnoremap @@ C:\Users\aholguin-ext\Documents\
"cabbrev dsur z:\_STAT\PEANUT\META\PROG\06_Analysis\DSUR2020
"cabbrev eu z:\_STAT\PEANUT\META\PROG\06_Analysis\EU
"cabbrev realise z:\_STAT\PEANUT\REALISE
"cabbrev pepites z:\_STAT\PEANUT\PEPITES
"cabbrev epitope z:\_STAT\PEANUT\EPITOPE
cabbrev dsur \\192.168.155.33\sasdata\_STAT\PEANUT\META\PROG\06_Analysis\DSUR2020
cabbrev eu \\192.168.155.33\sasdata\_STAT\PEANUT\META\PROG\06_Analysis\EU
cabbrev realise \\192.168.155.33\sasdata\_STAT\PEANUT\REALISE
cabbrev pepites \\192.168.155.33\sasdata\_STAT\PEANUT\PEPITES
cabbrev epitope \\192.168.155.33\sasdata\_STAT\PEANUT\EPITOPE

"Temporary remapings for projects
nnoremap \ee :source \Users\aholguin-ext\Documents\temp\script_EU_204.vim

"Calypse Consulting
"****************************************
cabbrev d; D:\Calypse_projet_etoile
"nnoremap <leader>aa A else {<esc>oload("changethisnonsense.rda")<esc>o}<esc>/changethisnonsense<cr>:s//
"nnoremap <leader>eu :g/}/norm \aa<cr>
nnoremap <leader>aa o#Data discrepancies creationlibrary("dplyr")q_changeme <- changeme %>% filter() %>% mutate(query = "text")report_changeme <- q_changemesave(report_changeme, "report_changeme.rda")
nnoremap <leader>eu :g/save(/norm \aa<cr>/changeme<cr>

"ICON/DOCS mappings
"****************************************
iabbrev tda2 DE#TDA2
iabbrev admin IADM
iabbrev train IBILL
iabbrev jtrain JBILL
iabbrev jadmin JADM

"Abbreviation below is used to access Work Library on LSAF server in Fedora
cabbrev lsafw  /run/user/1000/gvfs/dav:host=jajprod.ondemand.sas.com,ssl=true,prefix=\%2Flsaf\%2Fwebdav\%2Fwork
"Abbreviation below is used to access Repo Library on LSAF server in Fedora
cabbrev lsafr /run/user/1000/gvfs/dav:host=jajprod.ondemand.sas.com,ssl=true,prefix=\%2Flsaf\%2Fwebdav\%2Frepo

"Steps below configure the textbox that appears in firefox
if exists('g:started_by_firenvim') && g:started_by_firenvim
    " general options
    set laststatus=0 nonumber noruler noshowcmd

    augroup firenvim
        autocmd!
        autocmd BufEnter *.txt setlocal filetype=markdown.pandoc
    augroup END
endif
