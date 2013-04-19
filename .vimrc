set nocompatible               " be iMproved
let mapleader=','              " Change leader key from \ to ,
set timeoutlen=500           " Time to wait after ESC (default 1000 causes an annoying delay)


filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'


" ============================= My Bundles here {{{

" original repos on github
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-endwise'

" Vim-surround
" press cs'<b> to change 'hello' to <b>hello</b>
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

" Fugitive : Git support
" Adds pervasive git support to git directories in vim. 
" For more information, use :help fugitive
" Use :Gstatus to view git status and type - on any file to stage or unstage it.
" Type p on a file to enter git add -p and stage specific hunks in the file.
" Use :Gdiff on an open file to see what changes have been made to that file
" :Git add %      :Gwrite  : Stage the current file to the index
" :Git checkout % :Gread   : Revert current file to last checked in version
" :Git rm %       :Gremove : Delete the current file and the corresponding Vim buffer
" :Git mv %       :Gmove   : Rename the current file and the corresponding Vim buffer
" :Git blame %    :Gblame  : Git blame
Bundle 'tpope/vim-fugitive'

" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'

" Command-T : Fast file navigation for VIM
" Bundle 'git://git.wincent.com/command-t.git'
" nnoremap // :TComment<CR>
" vnoremap // :TComment<CR>

" CtrlP : Command Fuzzy file, buffer, mru and tag finder. Replaces Command-T
Bundle 'kien/ctrlp.vim'
map <D-t> CtrlP<CR>
imap <D-t> <ESC>:CtrlP<CR>

" NERDTree
Bundle 'scrooloose/nerdtree'

" Syntastic : Syntastic is a syntax checking plugin that runs buffers through 
" external syntax checkers as they are saved and opened. If syntax errors are 
" detected, the user is notified and is happy because they didn't have to 
" compile their code or execute their script to find them.
Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" NERDCommenter
Bundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1     "Extra space around delimiters when commenting
if has("gui_macvim") && has("gui_running")
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>
else
  map<leader>/ <plug>NERDCommenterToggle<CR>
  imap <leader>/ <Esc><plug>NERDCommenterToggle<CR>
endif

" Tagbar : Tagbar is a vim plugin for browsing the tags of source code files.
Bundle 'majutsushi/tagbar'


" Zoomwin
Bundle "ZoomWin"
noremap <LocalLeader>o :ZoomWin<CR>
vnoremap <LocalLeader>o <C-C>:ZoomWin<CR>
inoremap <LocalLeader>o <C-O>:ZoomWin<CR>
noremap <C-W>+o :ZoomWin<CR>

" Ack
" Bundle 'ack.vim'
" map <D-F> :Ack<space>
" noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
" vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>

" ag: The Silver Searcher
Bundle 'rking/ag.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
map <D-F> :Ag -i<space>
noremap <LocalLeader># "ayiw:Ag <C-r>a<CR>
vnoremap <LocalLeader># "ay:Ag <C-r>a<CR>

" Super Tab : In insert mode, start typing something 
" and hit <TAB> to tab-complete based on the current context.
Bundle 'ervandew/supertab'

" vim-buffergator
" <Leader>b
Bundle 'jeetsukumaran/vim-buffergator'

" Matchit
Bundle 'edsono/vim-matchit'

" Gundo.vim visualize your Vim undo tree
Bundle 'sjl/gundo.vim'
nnoremap <F6> :GundoToggle<CR>

" Rename2
Bundle 'Rename2'

" Align
Bundle 'tsaleh/vim-align'

" LANGUAGES

Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
Bundle 'nono/vim-handlebars'

" ColorScheme
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'

" Status line
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'


filetype plugin indent on     " required!     Automatically detect file types.
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" ================ }}}



" ============================= General {{{
set history=256
set encoding=utf-8    " Set default encoding to UTF-8
syntax enable         " Turn on syntax highlighting allowing local overrides
set mouse=a           " enable mouse in GUI mode

set autowrite  " Writes on make/shell commands
set autoread

set clipboard+=unnamed  " Yanks go on clipboard instead.
set pastetoggle=<F10> "  toggle between paste and normal: for 'safer' pasting from keyboard
set tags=./tags;$HOME " walk directory tree upto $HOME looking for tags

" Modeline
" set modeline
" set modelines=5 " default numbers of lines to read for modeline instructions

""
"" Backup and swap files
""

set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.

" Turn Off Swap Files
set noswapfile
set nobackup
set nowritebackup


set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden " The current buffer can be put to the background without writing to disk


" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1


" ================ }}}



" ============================= Formatting {{{
set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0   " Don't wrap lines by default

"" Wild settings
"
set wildmode=longest,list:full    " At command line, complete longest common string, then list alternatives.
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" Disable temp and backup files
set wildignore+=*.swp,*~,._*

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set backspace=indent,eol,start  " backspace through everything in insert mode

set softtabstop=2
set shiftwidth=2  " Set the default shift width for indents
set expandtab     " Make tabs into spaces (set by tabstop)
set smarttab      " Smarter tab levels

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs

set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case
syntax on         " enable syntax
" ================ }}}



" ============================= Visual {{{
"
" Colorscheme
" set background=dark
" color solarized
color molokai

if has("gui_running")
  " set guifont=Andale\ Mono:h13
  " set guifont=Menlo\ Regular:h12
  set guifont=Menlo\ Regular\ for\ Powerline:h12
  set antialias
  set visualbell
endif

set guioptions-=T          " do not show toolbar
set guioptions+=c          " console dialogs
set guioptions+=M          " ?
" set guioptions=egmrLtT   " default

set number  " Line numbers on
set ruler  " Show ruler
set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
" set novisualbell
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
" set vb t_vb= " disable any beeps or flashes on error
" set showcmd " Display an incomplete command in the lower right corner of the Vim window
" set shortmess=atI " Shortens messages

" List chars
set list                          " Show invisible characters
set listchars=""                  " Reset the listchars
set listchars=tab:·\              " a tab should display as "· ", trailing whitespace as "."
set listchars+=trail:·            " show trailing spaces as dots
set listchars+=extends:»          " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen
set listchars+=precedes:«         " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen

" Folding
set foldenable " Turn on folding
set foldmethod=syntax " Fold on the syntax/indent/marker
set foldlevel=1 " Don't autofold anything (but I can still fold manually)
" set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds 

" set mouse-=a   " Disable mouse
" set mousehide  " Hide mouse after chars typed

set splitbelow
set splitright

" ================ }}}



" ============================= Mapping {{{

"explorer mappings
nnoremap <f1> :BuffergatorToggle<cr>
nnoremap <f2> :NERDTreeToggle<cr>
nnoremap <f3> :CtrlP<cr>
nnoremap <f4> :TagbarToggle<cr>

"make Y consistent with C and D
nnoremap Y y$

" Toggle paste mode
nmap <silent> <F8> :set invpaste<CR>:set paste?<CR>
imap <silent> <F8> <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nmap <leader>fef ggVG=

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

if has("gui_macvim") && has("gui_running")
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Bubble single lines
  nmap <D-Up> [e
  nmap <D-Down> ]e
  nmap <D-k> [e
  nmap <D-j> ]e

  " Bubble multiple lines
  vmap <D-Up> [egv
  vmap <D-Down> ]egv
  vmap <D-k> [egv
  vmap <D-j> ]egv
else
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <A-]> >gv
  vmap <A-[> <gv

  nmap <A-]> >>
  nmap <A-[> <<

  omap <A-]> >>
  omap <A-[> <<

  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i

  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e
  nmap <C-k> [e
  nmap <C-j> ]e

  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv
  vmap <C-k> [egv
  vmap <C-j> ]egv

  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" Make Control-direction switch between windows (like C-W h, etc)
nmap <silent> <C-k> <C-W><C-k>
nmap <silent> <C-j> <C-W><C-j>
nmap <silent> <C-h> <C-W><C-h>
nmap <silent> <C-l> <C-W><C-l>

" http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif


" ================ }}}
