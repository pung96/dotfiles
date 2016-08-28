"===================================================================================
" GENERAL SETTINGS
"===================================================================================
"
"-------------------------------------------------------------------------------
" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
"-------------------------------------------------------------------------------
set nocompatible
set number
set hidden "for LustyExplorer

let mapleader = ","
let g:mapleader = ","



"
"-------------------------------------------------------------------------------
" Enable file type detection. Use the default filetype settings.
" Also load indent files, to automatically do language-dependent indenting.
"-------------------------------------------------------------------------------
filetype  plugin on
filetype  indent on
syntax    on            

"
"-------------------------------------------------------------------------------
" Directories
"-------------------------------------------------------------------------------
if  has("win16") || has("win32") || has("win64") || has("win95")
  "  set backupdir =$VIM\vimfiles\backupdir
  "  set dictionary=$VIM\vimfiles\wordlists/german.list
else
  set backupdir =$HOME/.vim/backupdir
  "set dictionary=$HOME/.vim/wordlists/english.list
  set directory=$HOME/.vim/swapdir
endif
"
"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
"== indent
set autoindent                  " copy indent from current line
set smartindent                 " smart autoindenting when starting a new line
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab                   " set et
set cinoptions+=g0,h2

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set laststatus=2
"set relativenumber
set undofile

"== SEARCH 
set hlsearch                    " highlightthe last used search pattern
set incsearch                   " do incremental searching
set ignorecase                  "Ignore case when searching
"== ETC 
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set backup                      " keep a backup file
"set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan the files given with the 'dictionary' option
set history=50                  " keep 50 lines of command line history
"set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
"set mouse=nv                     " enable the use of the mouse
"set magic                       "TODO
"set cb=unnamed
"set nowrap                      " do not wrap lines
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
"set shiftwidth=4             	" number of spaces to use for each step of indent
set showcmd                     " display incomplete commands
"set tabstop=4                   " number of spaces that a <Tab> counts for
set visualbell                  " visual bell instead of beeping
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
set smartcase                   " TODO
"set showmatch                   "Show matching bracets when text indicator is over them TODO
"set mat=2                       "How many tenths of a second to blink TODO
"
"-------------------------------------------------------------------------------
" The current directory is the directory of the file in the current window.
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
  "autocmd BufWritePost .vimrc source %
  "autocmd vimenter * NERDTree
  "autocmd filetype html,xml set listchars-=tab:>.

endif
"
"-------------------------------------------------------------------------------
"  highlight paired brackets
"-------------------------------------------------------------------------------
highlight MatchParen ctermbg=blue guibg=lightyellow


"-------------------------------------------------------------------------------
"  HOTKEYS
"-------------------------------------------------------------------------------
"     F2  -  write file without confirmation
"-------------------------------------------------------------------------------
noremap   <silent>  <F2>             :NERDTreeToggle<CR>
inoremap  <silent>  <F2>        <C-C>:NERDTreeToggle<CR>

"noremap   <silent>  §o             :NERDTreeToggle<CR>
"noremap   <silent>  `b             :BufExplorer<CR>
"noremap   <silent>  §t             :TlistToggle<CR>
"noremap             'ls         :ls<CR>:edit #
"map ' <C-f>

noremap   <silent>  'b         :LustyBufferExplorer<CR>
noremap   <silent>  'j         :LustyJuggler<CR>
noremap             'o         :LustyFilesystemExplorer<CR>
noremap             'f         /{<CR>zf%
"noremap             §f         /{<CR>zf%
noremap              z[         v/}<CR>zf

noremap   <C-tab>         <C-C>:LustyBufferExplorer<CR>

noremap   <silent>  '1        :b 1<CR>
noremap   <silent>  '2        :b 2<CR>
noremap   <silent>  '3        :b 3<CR>
noremap   <silent>  '4        :b 4<CR>
inoremap   <silent>  §1        <C-C>:b 1<CR>
inoremap   <silent>  §2        <C-C>:b 2<CR>
inoremap   <silent>  §3        <C-C>:b 3<CR>
inoremap   <silent>  §4        <C-C>:b 4<CR>

noremap    <silent> ±1        :tabdo 1<CR>
noremap    <silent> ±2        :tabdo 2<CR>

"== Fast switching between buffers
noremap  <silent> <s-tab>       :if &modifiable && !&readonly && 
      \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
inoremap  <silent> <s-tab>  <C-C>:if &modifiable && !&readonly && 
      \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'lervag/vimtex'
call plug#end()

"-------------------------------------------------------------------------------
" PLUGIN
"-------------------------------------------------------------------------------
"== TAGLIST 
"let tlist_perl_settings  = 'perl;c:constants;f:formats;l:labels;p:packages;s:subroutines;d:subroutines;o:POD'

"== CTRL
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*pdf,*png,*.o,*.root

"-------------------------------------------------------------------------------
" APPREANCE
"-------------------------------------------------------------------------------
"set guifont=Monaco:h13
"colorscheme molokai
"set background=dark
"let g:molokai_original = 1

"-------------------------------------------------------------------------------
" additional filetype
"-------------------------------------------------------------------------------
augroup filetype
  au!
  au! BufRead,BufNewFile *.C    set filetype=cpp
augroup END

"-------------------------------------------------------------------------------
" MAP
"-------------------------------------------------------------------------------
nmap <silent> ,/ :nohlsearch<CR>

