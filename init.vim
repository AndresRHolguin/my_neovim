"Neovim config file
"
"github: AndresRHolguin/myneovim
"Version: Nvim 0.5+

"set foldmethod=marker

"Change options so loading a session takes current vimrc configuration
set ssop-=options    "do not store global and local values in a session
set ssop-=folds      "do not store folds

"Plugins {{{
call plug#begin(stdpath('data') . '/plugged')

"Adding a color theme
Plug 'ayu-theme/ayu-vim'
"Plugin to handle comments
Plug 'preservim/nerdcommenter'
"Plugin to edit csv files
Plug 'chrisbra/csv.vim'
"Plugin to change symbols around a phrase or word, e.g. change ' to " | Plugin to allow . to repeat mappings from custom plugins (Added to support vim-surround)
Plug 'tpope/vim-surround' | Plug 'tpope/vim-repeat'
"Plugin to connect neovim with web browser
Plug 'glacambre/firenvim'
"Add COC support to autocomplete and other functions
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plugin to autocomplete text (let's see how it works)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } | Plug 'deoplete-plugins/deoplete-lsp'
"Plugin to handle configure native lsp in neovim (Replaces coc)
Plug 'neovim/nvim-lspconfig'

call plug#end()
"Plugins }}}

"Plugins configuration {{{
"COC: Added this line to change default refresh time
"set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"Deoplete
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#lsp#handler_enabled = 1

lua << EOF 
require'lspconfig'.pyright.setup{}
EOF 

"Firenvim {{{

"Steps below configure the textbox that appears in firefox
if exists('g:started_by_firenvim') && g:started_by_firenvim
    " general options
    set laststatus=0 nonumber noruler noshowcmd

    augroup firenvim
        autocmd!
        autocmd BufEnter *.txt setlocal filetype=markdown.pandoc
    augroup END
endif

"Firenvim }}}

"Plugins configuration }}}

"General {{{

"nmap ) <Nop> "This command unmaps the ) key to be used as leader without moving the cursor when no further keys are commented, probably it is no necessary
let mapleader = ')' "Set leader key to use with Ergodox EZ
set history=500 "Set history greater than default
set hidden "Set hidden to allow editing multiple buffers without saving each time you move
set backspace=indent,eol,start "Allow backspace to delete indents and previously entered lines
syntax on "Activate syntax color
set cursorline "Highlight current cursor line
set incsearch "Allow incremental search it gives a more practical highlight search
set hlsearch "Set highlight on search
set ruler "Add position information at screen's bottom right
set termguicolors "True color support
let ayucolor="dark"   " for dark version of theme ayu
colorscheme ayu "Select colorscheme
set ignorecase "Ignore case of the search
set smartcase "If caps are used in search it will override ignorecase
set wildignorecase "Ignore case when opening files or directories
set splitright "Open new file views on the right
"set indentexpr "Indentation method
set smartindent "Indentation method
set wildmenu "Change the way tab key works in path completions
set wildmode=longest,list,full "first tab try to complete until partial match, second tab to open a list and third tab to cycle through the list
set foldmethod=syntax "Use folding according to the type of file used
set nofoldenable "Open the file in unfolded state, use zM to close all folds
set timeoutlen=500 "This command gives time to type the mappings assigned to leader key without executing original key function first
"Change tab to spaces to match indentation in external programs like SAS {{{
set tabstop=4
set shiftwidth=4
set expandtab
"Change tab to spaces to match indentation in external programs like SAS }}}
"Configure ruler number {{{
"Add relative numberlines
set number
set relativenumber
"Modify path to be able to find files recursively based on partial names
set path+=**
"Modify number lines so relativenumber is only shown in normal mode
augroup numbertoggle
autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
"Configure ruler number }}}
"Customize statusline {{{
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
set laststatus=2 "Always show status line
"Customize statusline }}}
"Change fold method to syntax when opening sas files
"augroup sas_folds
   "autocmd!
   "autocmd BufRead *.sas :set foldmethod=syntax
"augroup END

"General }}}

"Remaps {{{

"Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"Previous buffer
nnoremap <silent> ¿¿ :bp<CR>
"Next buffer
nnoremap <silent> ¡¡ :bn<CR>
"Go to first buffer
nnoremap <silent> çç :b#<CR>
"Command to change the current directory for the current buffer
nnoremap <leader>cd :lcd %:h<CR>
"remap to use in help page
nnoremap <silent> g] <C-]> 
"Open vim.init in a new vertical window
"nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
"Reload vim.init settings
nnoremap <leader>sv :source $MYVIMRC<cr>
"Remap to quickly change the foldmethod to marker
nnoremap <leader>fm :set foldmethod=marker<cr>za

"SAS specific remaps {{{

"Remap to put the date at the end of the line
nnoremap <leader>id A<C-R>=strftime('%d%b%Y')<CR><ESC>
nnoremap <leader>ic A/*Andrés Holguín <C-R>=strftime('%d%b%Y')<esc>*/<ESC>
"Remap to insert the date while typing
inoremap <leader>id <C-R>=strftime('%d%b%Y')<CR> 

"Enter a comment and allow to enter supplementary text
inoremap <leader>sc /*Andrés Holguín <C-R>=strftime('%d%b%Y')<CR>*/<esc>bi
nnoremap <leader>sc A /*Andrés Holguín <C-R>=strftime('%d%b%Y')<CR>*/<esc>bi

"Enter a basic sql step
"inoremap <leader>sql proc sql;<cr>create table changethis as<cr>select *<cr>from changethis<cr>where changethis<cr>group by changethis<cr>order by changethis<cr>;<cr><esc>Iquit;<esc>{/changethis<cr>
iabbrev sql sql;<cr>create table changethis as<cr>select *<cr>from changethis<cr>where changethis<cr>group by changethis<cr>order by changethis<cr>;<cr><esc>Iquit;<esc>{/changethis<cr>

"SAS specific remaps }}}

"ICON/DOCS mappings {{{

iabbrev tda2 DE#TDA2
iabbrev admin IADM
iabbrev train IBILL
iabbrev jtrain JBILL
iabbrev jadmin JADM

"ICON/DOCS mappings }}}

"LSAF Janssen {{{

"Abbreviation below is used to access Work Library on LSAF server in Fedora
cabbrev lsafw  /run/user/1000/gvfs/dav:host=jajprod.ondemand.sas.com,ssl=true,prefix=\%2Flsaf\%2Fwebdav\%2Fwork
"Abbreviation below is used to access Repo Library on LSAF server in Fedora
cabbrev lsafr /run/user/1000/gvfs/dav:host=jajprod.ondemand.sas.com,ssl=true,prefix=\%2Flsaf\%2Fwebdav\%2Frepo

"LSAF Janssen }}}

"Remaps }}}
