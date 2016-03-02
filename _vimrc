" ==============================================================================
" Setup plugins
"
filetype off

if has("unix")
  call plug#begin('~/.vim/plugged')
else
  call plug#begin('~/vimfiles/plugged')
endif

"call plug#begin()
  " ========================================================================== "
  " Default set of vim settings that everyone can agree on.
  Plug 'tpope/vim-sensible'


  " ========================================================================== "
  " Vim theme.
  "
  " Solarized colorscheme.
  Plug 'altercation/vim-colors-solarized'
  " For better looking ViM status.
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " ========================================================================== "
  " Additional GUI and behavioral features.
  "
  " Zoom in/out text.
  Plug 'drmikehenry/vim-fontsize'
  " Tree navigation for file browsing.
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  " Full path fuzz file, buffer, mru, tag, ... finder.
  Plug 'ctrlpvim/ctrlp.vim'
  " For quick string search
  Plug 'rking/ag.vim'
  " Enhanced tab.
  Plug 'ervandew/supertab'
  " Simple motions in vim.
  Plug 'easymotion/vim-easymotion'
  " Integration with Git.
  Plug 'tpope/vim-fugitive'

  " To automatically enclose code within parentheses, quotes, or whatever.
  Plug 'tpope/vim-surround'  " help: surround

  " To highlight indent levels in ViM.
  Plug 'nathanaelkane/vim-indent-guides'  " help: indent-guides, (<Leader>ig.)


  " ========================================================================== "
  " Syntax checker
  Plug 'scrooloose/syntastic'

  " Multi-language code autoformatting
  Plug 'Chiel92/vim-autoformat', { 'for': 'cpp' }

  " Markdown.
  Plug 'plasticboy/vim-markdown'
  " Fast HMTL editing.
  Plug 'mattn/emmet-vim'

  " Javascript support.
  Plug 'jelera/vim-javascript-syntax', { 'for': ['html', 'javascript'] }
  Plug 'pangloss/vim-javascript', { 'for': ['html', 'javascript'] }
  Plug 'kchmck/vim-coffee-script', { 'for': ['html', 'javascript'] }
  Plug 'marijnh/tern_for_vim', { 'for': ['html', 'javascript'] }

  " Python support.
  Plug 'davidhalter/jedi-vim', { 'for': 'python' }
  Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
  Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }

  " Shell script support.
  Plug 'vim-scripts/sh.vim--Cla'

  " Protobuf
  Plug 'uarun/vim-protobuf'

  " C++ IDE.
  if has("unix")
    function! BuildYCM(info)
      if a:info.status == 'installed' || a:info.force
        !./install.sh --clang-completer
      endif
    endfunction

    " Autocompletion.
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    autocmd! User YouCompleteMe call youcompleteme#Enable()

    " Conque-GDB
    Plug 'vim-scripts/Conque-GDB'
  endif
call plug#end()



" ==============================================================================
" => Prefer using project-specific `.vimrc` file.
set exrc
set secure


" ==============================================================================
" => GUI behavioral options.
"
" No annoying sound on errors.
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Allow arrow keys to navigate in text.
set whichwrap+=<,>,h,l

" Enable mouse.
set mouse=a


" ==============================================================================
" => GUI general display options.
"
" Always show line number of the cursor.
set number

" A buffer becomes hidden when it is abandoned
set hid

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set guitablabel=%M\ %t

  if has("gui_gtk2")
    set guifont=Roboto\ Mono\ for\ Powerline\ Regular\ 8.5
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Set color scheme
set background=light
if has("gui_running")
  colorscheme solarized
else
  set t_Co=256
  let g:solarized_termcolors=256
endif



" ==============================================================================
" => Search settings.
"
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

" Ignore case when searching.
set ignorecase
" When searching try to be smart about cases.
set smartcase
" Highlight search results.
set hlsearch
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
" By default set linewidth to 80 column.
set textwidth=80
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" Use spaces instead of tabs
set expandtab
" 2 spaces per tabs.
set shiftwidth=2
set tabstop=2
" Linebreak on 500 characters
set lbr
set tw=500

set si "Smart indent
set wrap "Wrap lines



" ==============================================================================
" => Code folding options.
"
let g:sh_fold_enabled=7
let g:is_bash=1
set nofoldenable
set foldmethod=indent



" ==============================================================================
" => Specify the behavior when switching between buffers
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
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMouseMode = 3
map <S-Tab> :NERDTreeToggle<CR>

" Search for the word under the cursor.
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Shortcut key for code autoformatting.
autocmd FileType c,cpp,objc,python noremap <C-K><C-F> :Autoformat<CR>



" ==============================================================================
" => C++ IDE

" Editing options.
autocmd FileType c,cpp,objc setlocal cindent
autocmd FileType c,cpp,objc setlocal cino=(0,W4,g0,i-s,:0
autocmd FileType c,cpp,objc setlocal foldmethod=syntax

" Toggle auto formatting.
autocmd FileType c,cpp,objc nnoremap <Leader>jd :YcmCompleter GoTo<CR>

" Use clang-format in C-family based code.
let s:configfile_def = "'clang-format-3.6 -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').' -style=file'"
let s:noconfigfile_def = "'clang-format-3.6 -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').' -style=\"{BasedOnStyle: WebKit, AlignTrailingComments: true, '.(&textwidth ? 'ColumnLimit: '.&textwidth.', ' : '').(&expandtab ? 'UseTab: Never, IndentWidth: '.shiftwidth() : 'UseTab: Always').'}\"'"
let g:formatdef_clangformat = "g:ClangFormatConfigFileExists() ? (" . s:configfile_def . ") : (" . s:noconfigfile_def . ")"

" GDB integration.
let g:ConqueTerm_Color = 2
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_StartMessages = 0



" ==============================================================================
" => Shell script IDE.
"
autocmd FileType sh setlocal foldmethod=syntax



" ==============================================================================
" => Python IDE.
"
" Indentation.
autocmd FileType python setlocal foldmethod=indent
autocmd FileType python setlocal textwidth=79

" Jedi-vim
"let g:jedi#force_py_version = 3
let g:neocomplcache_enable_at_startup = 1
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions['python'] = 'jedi#completions'
let g:jedi#popup_on_dot = 0

" Vim-flake8
autocmd FileType python map <buffer> <C-b> :call Flake8()<CR>
