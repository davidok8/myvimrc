" ==============================================================================
" Setup Vundle package.
"
set nocompatible
filetype off

if has("unix")
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
else
  set rtp+=~/vimfiles/bundle/Vundle.vim
  let path='~/vimfiles/bundle'
  call vundle#begin(path)
endif

"vundle#begin()
  " Firstly let Vundle manage the plugins.
  Plugin 'gmarik/Vundle.vim'
  " Secondly add other plugins.

  " Solarized colorscheme.
  Plugin 'altercation/vim-colors-solarized'
  " For better looking ViM status.
  Plugin 'bling/vim-airline'
  " Tree navigation for file browsing.
  Plugin 'scrooloose/nerdtree'
  " Simple motions in vim.
  Plugin 'Lokaltog/vim-easymotion'
  " To automatically enclose code within parentheses, quotes, or whatever.
  Plugin 'tpope/vim-surround'
  " To highlight indent levels in ViM.
  Plugin 'nathanaelkane/vim-indent-guides'
  " Integration with Git.
  Plugin 'tpope/vim-fugitive'
  " Markdown.
  Plugin 'plasticboy/vim-markdown'
  " Full path fuzz file, buffer, mru, tag, ... finder.
  Plugin 'kien/ctrlp.vim'
  " Fast HMTL editing.
  Plugin 'mattn/emmet-vim'
  " Javascript support.
  Plugin 'jelera/vim-javascript-syntax'
  Plugin 'pangloss/vim-javascript'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'marijnh/tern_for_vim'
  " Enhanced tab.
  Plugin 'ervandew/supertab'
  " Python support.
  Plugin 'davidhalter/jedi-vim'
  Plugin 'hynek/vim-python-pep8-indent'
  Plugin 'jmcantrell/vim-virtualenv'
  " For quick string search
  Plugin 'rking/ag.vim'
  " Protobuf
  Plugin 'uarun/vim-protobuf'

  " Syntax checker
  Plugin 'scrooloose/syntastic'

  " Conque-GDB
  Plugin 'vim-scripts/Conque-GDB'

  if has("unix")
    " Autocompletion.
    Plugin 'Valloric/YouCompleteMe'
    " C/C++/Objective-C code formatting.
    Plugin 'rhysd/vim-clang-format'
  endif
call vundle#end()



" ==============================================================================
" Prefer using project-specific `.vimrc` file.
set exrc
set secure


filetype plugin indent on


" ==============================================================================
" General display options.
"
" Always show current position (line, column) of the cursor.
set number
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set guitablabel=%M\ %t

  if has("gui_gtk2")
    set guifont=Roboto\ Mono\ for\ Powerline\ Regular\ 9
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
let g:airline_powerline_fonts=1


" Enable syntax highlighting
syntax enable

" Set color scheme
set background=light
if has("gui_running")
  colorscheme solarized
else
  set t_Co=256
  let g:solarized_termcolors=256
endif

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c:%m

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" ==============================================================================
" Behavior options.
"
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Enable mouse.
set mouse=a


" ==============================================================================
" Search options.
"
" Ignore case when searching.
set ignorecase
" When searching try to be smart about cases.
set smartcase
" Highlight search results.
set hlsearch
" Makes search act like search in modern browsers.
set incsearch
" Don't redraw while executing macros (good performance config).
set lazyredraw
" For regular expressions turn magic on.
set magic


" ==============================================================================
" => Files, backups and undo
"
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile



" ==============================================================================
" => Edit options.
"
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 2 spaces per tabs.
set shiftwidth=2
set tabstop=2
" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


" ==============================================================================
" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Remember info about open buffers on close
set viminfo^=%



" ==============================================================================
" => Status line
"
" Always show the status line
set laststatus=2



" ==============================================================================
" => Keybindings
"
" => Moving around, tabs, windows and buffers
"
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Tree navigation
let NERDTreeIgnore=['\.pyc$']
map <S-Tab> :NERDTreeToggle<CR>

" Search for the word under the cursor.
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>



" ==============================================================================
" C++ configuration.

" => Editing options.
set cindent
set cino+=(0,W2,g0,i-s,:0
set foldmethod=syntax
set nofoldenable
set textwidth=80

let g:clang_format#style_options = {
      \ "AccessModifierOffset" : -4,
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "Standard" : "C++11",
      \ "BreakBeforeBraces" : "Stroustrup" }

" Map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" If you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting.
autocmd FileType c,cpp,objc nmap <Leader>C :ClangFormatAutoToggle<CR>
autocmd FileType c,cpp,objc nnoremap <Leader>jd :YcmCompleter GoTo<CR>

" => GDB integration.
let g:ConqueTerm_Color = 2
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_StartMessages = 0



" ==============================================================================
" Python configuration
"
" => Indentation.
autocmd FileType python setlocal foldmethod=indent
autocmd FileType python setlocal textwidth=79

" => Jedi-vim
"let g:jedi#force_py_version = 3
let g:neocomplcache_enable_at_startup = 1
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions['python'] = 'jedi#completions'
let g:jedi#popup_on_dot = 0

" => Vim-flake8
autocmd FileType python map <buffer> <C-b> :call Flake8()<CR>
