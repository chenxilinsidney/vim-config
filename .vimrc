"==============================================================================
"Author:chen xi lin.
"Version:1.0
"E-Mail:chenxilinsidney@gmail.com
"Sections:
" ->For Vundle
" ->For Python Mode
" ->General
" ->VIM user interface
" ->Search
" ->Color and Fonts
" ->Files and backups
" ->Text,tab and indent related
" ->Status line
" ->tags and Taglist
" ->omnicppcomplete
" ->SuperTab
" ->C-support
" ->NERDtree
" ->Bufexplorer
" ->echofunc
" ->DoxygenToolkit
"Extra:
" ->fugitive: a git wrapper.
" ->Details: https://github.com/tpope/vim-fugitive
"==============================================================================
"==============================================================================
" ->For Vundle: Vundle is short for Vim bundle and is a Vim plugin manager.
" ->Details: https://github.com/gmarik/Vundle.vim
"==============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'klen/python-mode'
Plugin 'mbbill/echofunc'
Plugin 'ervandew/supertab'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'OmniCppComplete'
Plugin 'DoxygenToolkit.vim'
Plugin 'taglist.vim'
Plugin 'c.vim'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"==============================================================================
" ->For Python Mode: create python code quickly
" ->Details: https://github.com/klen/python-mode
"==============================================================================
" Pathogen load
filetype off
filetype plugin indent on
syntax on
"==============================================================================
" ->General
"==============================================================================
"close vi mode
set nocompatible
"set how many lines of history command mode(:command)VIM has to remember
set history=700
"enable filetype detect and plugins
filetype on
filetype plugin on
filetype indent on
"set auto read when a file is changed from the outside
set autoread
"==============================================================================
" ->VIM user interface
"==============================================================================
"set the wildcard menu on
set wildmenu
"set the wildcard ignored Files
set wildignore=*.o,*.pyc,*.bak
"set number line show on the left
set number
set numberwidth=4
"set text width for a line with number
set textwidth=80
set columns=84
"set text height line number
set lines=30
"set current position show
set ruler
"no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
"configure backspace so it acts as it should be
set backspace=indent,eol,start
"show command at the commandbar
set cmdheight=2
set showcmd
"do not redraw while executing macros
set lazyredraw
"a buffer becomes hidden when it is abandoned
set hidden
"show matchi brackets when text indicator is over them
set showmatch
set matchtime=5
"==============================================================================
" ->Search
"==============================================================================
"searching is not case sensitive
set ignorecase
"when searching try to be smart about cases with upper case
set smartcase
"highlight search result
set hlsearch
"makes search act like search in modern browers
set incsearch
"==============================================================================
" ->Color and Fonts
"==============================================================================
"enable syantax highlighting
syntax on
"colorscheme
colorscheme desert
set background=dark
"highlight current line
set cursorline
"set gui Fonts
set guifont=Consolas:h12
"==============================================================================
" ->Files and backups
"==============================================================================
"set utf8 as standard encoding.
set encoding=utf8
"set Unix as the standard file type
set ffs=unix,dos,mac
"set fast save and close
let g:mapleader =","
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>qq :q!<cr>
nmap <leader>wq :wq!<cr>
"turn backup off, since most stuff is in SVN,git etc.anyway.
set nobackup
set nowb
"turn swap file off
set noswapfile
"==============================================================================
" ->Text,tab and indent related
"==============================================================================
"set hightlight when width >= 80
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%80v.\+/
"Use spaces instead of tabs(to tab: ctrl + v + tab)
set expandtab
set smarttab
"1 tab = 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
"set auto indent
set ai
"set smart indent
set si
"set c style indent
set cindent
"linebreak when a line is too long, wrap it automatically.
set wrap
"==============================================================================
" ->Status line
"==============================================================================
"set the status line visible
set laststatus=2
"format the status line
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
"==============================================================================
" ->Tags and Taglist
"==============================================================================
"update tags
function! UpdateTags()
    execute ":!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q"
    echoh1 StatusLine | echo "C/C++ tag updated" | echoh1 None
endfunction
nnoremap <F8> :call UpdateTags() .<CR>
"set map F3 to toggle the taglist window
noremap <silent> <F3>  <Esc><Esc>:Tlist<CR>
inoremap <silent> <F3>  <Esc><Esc>:Tlist<CR>
"set ctags path
set tags+=./tags,tags ",~/.vim/systags
"set ctags bin path for Taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"open Taglist window as default
"let Tlist_Auto_Open=1
"show only one file tags
let Tlist_Show_One_File=0
"do not fold
let Tlist_File_Fold_Auto_Close=1
"close vim if only the taglist window
let Tlist_Exit_OnlyWindow=1
"close tags when open file
let Tlist_Close_On_Select=1
"focus on Taglist when opened
let Tlist_GainFocus_On_ToggleOpen=1
"display prototype
let Tlist_Display_Prototpye=1
"generate tags even the taglist window is closed
let Tlist_Process_File_Always=1
"define the heading for the (q)make sections
let tlist_make_settings='make;m:makros;t:targets;i:includes'
let tlist_qmake_settings='qmake;t:SystemVariables'
if has("autocmd")
    autocmd BufNewFile,BufRead *.pro set filetype=qmake
endif
"==============================================================================
" ->Omnicppcomplete
"==============================================================================
"Global scope search toggle enable
let OmniCpp_GlobalScopeSearch=1
"Namespace search method
let OmniCpp_NamespaceSearch=1
"Class scope completion mode
let OmniCpp_DisplayMode=1
"Show scope in abbreviation
let OmniCpp_ShowPrototypeInAbbr=1
"Show access
let OmniCpp_ShowAccess=1
"Default using namespace list
let OmniCpp_DefaultNamespaces=[]
"May complete behaviour
let OmniCpp_MayCompleteDot=1
let OmniCpp_MayCompleteArrow=1
let OmniCpp_MayCompleteScope=1
"Select/Don't select first popup item
let OmniCpp_SelectFirstItem=2
"Use local search function for variable definitions
let OmniCpp_LocalSearchDecl=0
"==============================================================================
" ->SuperTab
"==============================================================================
"Remember the completion type
let g:SuperTabRetainCompletitionType=2
"Used to set the default completion type
let g:SuperTabDefaultComletionType="<C-X><C-O>"
"==============================================================================
" ->C-support
"==============================================================================
"set map leader
"let g:C_MapLeader=','
"enable additional tools
let g:C_UseTool_cmake    = 'yes'
let g:C_UseTool_doxygen  = 'yes'
"==============================================================================
" ->NERDtree
"==============================================================================
"set NERDTree opened when open vim
"autocmd vimenter * NERDTree
"set map F2
map <F2> :NERDTreeToggle<CR>
map <leader><F2> :NERDTreeFind<CR>
"set root as pwd
let NERDTreeChDirMode=2
"show bookmarks
let NERDTreeShowBookmarks=1
"show arrows
let NERDTreeDirArrows=1
"close tree when file opened
let NERDTreeQuitOnOpen=1
"close vim if only NERDTree opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"==============================================================================
" ->Bufexplorer
"==============================================================================
"set map
map <leader><F4> :BufExplorer<CR>
nmap <F4> :BufExplorerHorizontalSplit<CR>
"==============================================================================
" ->echofunc: echo function declaration in the command line for C/C++
"==============================================================================
let g:EchoFuncKeyNext='<C-n>'
let g:EchoFuncKeyPre='<C-p>'
"format for echofunc plugin
if has('statusline')
    let g:EchoFuncShowOnStatus=1
    "set statusline=%{EchoFuncGetStatusLine()}
endif
"==============================================================================
" ->DoxygenToolkit
"==============================================================================
let g:doxygenToolkit_authorName="chenxilinsidney"
let g:doxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_enhanced_color=1
map <F6>a :DoxAuthor
map <F6>f :Dox
map <F6>b :DoxBlock
map <F6>c O/** */<Left><Left>
