" ==============================================================================
" Setup plugins

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

  " Asynchronous command support.
  Plug 'tpope/vim-dispatch'

  " Easily switch buffer and other things.
  Plug 'tpope/vim-unimpaired'
  " Even better...
  Plug 'vim-ctrlspace/vim-ctrlspace'

  " Multi-colored cursor.
  " Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " Distraction-free editing.
  Plug 'junegunn/goyo.vim'

  " Conversion from camelcase to snake case etc.
  Plug 'tpope/vim-abolish'

  Plug 'junegunn/goyo.vim'

  " ========================================================================== "
  " Vim theme.
  "
  " Solarized colorscheme.
  Plug 'altercation/vim-colors-solarized'
  Plug 'rakr/vim-one'
  Plug 'kristijanhusak/vim-hybrid-material'
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
  Plug 'PhilRunninger/nerdtree-visual-selection'
  " Full path fuzz file, buffer, mru, tag, ... finder.
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

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
  " Fix common writing problems
  Plug 'davidbeckingsale/writegood.vim'


  " ========================================================================== "
  " Syntax checker
  Plug 'w0rp/ale', { 'for': ['html', 'javascript', 'python'] }

  " Multi-language code autoformatting
  Plug 'Chiel92/vim-autoformat'

  " Bar on the right listing variables, functions for any languages.
  Plug 'majutsushi/tagbar'

  " Markdown.
  Plug 'plasticboy/vim-markdown'

  " Fast HMTL editing.
  Plug 'mattn/emmet-vim'

  " Javascript support.
  Plug 'pangloss/vim-javascript', { 'for': ['html', 'javascript'] }
  Plug 'mxw/vim-jsx', { 'for': ['html', 'javascript'] }

  " Python support.
  Plug 'davidhalter/jedi-vim', { 'for': 'python' }
  Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
  Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }

  " Shell script support.
  Plug 'vim-scripts/sh.vim--Cla'

  " Powershell script support.
  Plug 'PProvost/vim-ps1'

  " Protobuf
  Plug 'jdevera/vim-protobuf-syntax'

  " Swift
  Plug 'keith/swift.vim'

  " QML
  Plug 'peterhoeg/vim-qml'

  " Latex support
  Plug 'lervag/vimtex'
  Plug 'xuhdev/vim-latex-live-preview'

  " C++ IDE.
  if has("unix")
    function! BuildYCM(info)
      if a:info.status == 'installed' || a:info.force
        !./install.py --clang-completer
      endif
    endfunction

    " Autocompletion.
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    autocmd! User YouCompleteMe call youcompleteme#Enable()

    Plug 'realincubus/vim-clang-refactor', { 'for': 'cpp' }
  endif

  " F# IDE.
  Plug 'fsharp/vim-fsharp', {
    \ 'for': 'fsharp',
    \ 'do': 'make fsautocomplete',
    \}

  " Haskell IDE.
  Plug 'dag/vim2hs'

  " Rust IDE.
  Plug 'rust-lang/rust.vim'
  Plug 'racer-rust/vim-racer'
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
set ttymouse=xterm2
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
  " let g:terminal_ansi_colors = [
  "       \ '#616e64', '#0d0a79',
  "       \ '#6d610d', '#0a7373',
  "       \ '#690d0a', '#6d696e',
  "       \ '#0d0a6f', '#616e0d',
  "       \ '#0a6479', '#6d0d0a',
  "       \ '#617373', '#0d0a69',
  "       \ '#6d690d', '#0a6e6f',
  "       \ '#610d0a', '#6e6479',
  "       \]

  set guioptions-=m
  set guioptions-=r
  set guioptions-=L
  set guioptions-=T
  set guioptions+=e
  set guitablabel=%M\ %t

  if has("gui_gtk2") || has("gui_gtk3")
    set guifont=Hack\ Regular\ 9
  elseif has("gui_macvim")
    set guifont=Meslo\ LG\ M\ for\ Powerline:h12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" Set color scheme
if !has("gui_running")
  let g:solarized_termcolors=65536
  let g:solarized_termtrans=1
endif

colorscheme solarized
set background=dark


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
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix
" Use spaces instead of tabs
set expandtab
" 2 spaces per tabs.
set shiftwidth=2
set tabstop=2
" Linebreak on 80 characters
set lbr
set tw=80
" Smart indent
set si
" Wrap lines
set wrap


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

let mapleader=";"

" Disable highlight when <leader><CR> is pressed.
map <silent> <leader><CR> :noh<CR>

" Close all the buffers.
map <leader>ba :%bd!<CR>
" Close all buffers but this one.
map <leader>bc :NERDTreeClose<bar>bufdo bd<CR>

" Useful mappings for managing tabs
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Close split buffer without killing split.
map <leader>tq :bp\|bd # <CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Tree navigation
let NERDTreeIgnore = ['\.DS_Store', '\.pyc$', '__pycache__']
let NERDTreeMouseMode = 3

map <S-Tab> :NERDTreeToggle<CR>
map <C-p> :FZF<CR>

" File explorers.
function RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun

map <Leader>xr :call RangerExplorer()<CR>
map <Leader>xx :Dispatch caja .<CR>
map <Leader>tt :TagbarToggle<CR>
map <Leader>tg :Goyo<CR>

" ==============================================================================
" => C++ IDE

" Define CUDA file extensions.
au BufRead,BufNewFile *.cu set filetype=cpp
au BufRead,BufNewFile *.hq set filetype=cpp
au BufRead,BufNewFile *.mm set filetype=objc
au BufRead,BufNewFile *.qrc set filetype=html

" Search for the word under the cursor.
autocmd FileType c,cpp,objc,python nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Shortcut key for code autoformatting.
autocmd FileType c,cpp,objc,python noremap <C-K><C-F> :Autoformat<CR>

" Editing options.
autocmd FileType c,cpp,objc setlocal cindent
autocmd FileType c,cpp,objc setlocal cino=(0,W4,g0,i-s,:0
autocmd FileType c,cpp,objc setlocal foldmethod=syntax

" Jump to definition.
autocmd FileType c,cpp,objc nnoremap <Leader><F2> :YcmCompleter GoTo<CR>
autocmd FileType c,cpp,objc nnoremap <Leader>j :YcmCompleter GoTo<CR>

" Use clang-format in C-family based code.
let s:configfile_def = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').' -style=file'"
let s:noconfigfile_def = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').' -style=\"{BasedOnStyle: WebKit, AlignTrailingComments: true, '.(&textwidth ? 'ColumnLimit: '.&textwidth.', ' : '').(&expandtab ? 'UseTab: Never, IndentWidth: '.shiftwidth() : 'UseTab: Always').'}\"'"
let g:formatdef_clangformat = "g:ClangFormatConfigFileExists() ? (" . s:configfile_def . ") : (" . s:noconfigfile_def . ")"

" Use clang-rename.
let g:clang_rename_path = "/usr/bin/clang-rename-8"
autocmd FileType c,cpp nnoremap <leader>cr :py3file /home/david/.vim/clang-rename.py<cr>

packadd termdebug
autocmd FileType c,cpp nnoremap <Leader>b :Break<CR>
autocmd FileType c,cpp nnoremap <Leader>d :Delete<CR>
autocmd FileType c,cpp nnoremap <Leader>s :Step<CR>
autocmd FileType c,cpp nnoremap <Leader>n :Next<CR>
autocmd FileType c,cpp nnoremap <Leader>o :Over<CR>
autocmd FileType c,cpp nnoremap <Leader>c :Continue<CR>
hi debugPC term=reverse ctermbg=darkblue guibg=darkblue
hi debugBreakpoint term=reverse ctermbg=red guibg=red

" Help ALE parse C++ better.
let g:ale_c_parse_compile_commands = 1
let g:ale_linters = {'c': ['clang'], 'cpp': ['clang++, g++']}
let g:ale_cpp_clang_options = '-Wall -O2 -std=c++17 -x objective-c++ -fobjc-arc'

" ==============================================================================
" => LaTeX IDE.
"
let g:livepreview_previewer = 'atril'
au BufRead, BufNewFile *.tex set filetype=tex
autocmd FileType tex setlocal updatetime=1
autocmd FileType tex map <C-F12> :LLPStartPreview<CR>
" Reformat lines (getting the spacing correct) {{{
fun! TeX_fmt()
  if (getline(".") != "")
    let save_cursor = getpos(".")
    let op_wrapscan = &wrapscan
    set nowrapscan
    let par_begin = '^\(%D\)\=\s*\($\|\\start\|\\stop\|\\Start\|\\Stop\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\|\\noindent\>\)'
    let par_end   = '^\(%D\)\=\s*\($\|\\start\|\\stop\|\\Start\|\\Stop\|\\place\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\)'
    try
      exe '?'.par_begin.'?+'
    catch /E384/
      1
    endtry
    norm V
    try
      exe '/'.par_end.'/-'
    catch /E385/
      $
    endtry
    norm gq
    let &wrapscan = op_wrapscan
    call setpos('.', save_cursor)
  endif
endfun
autocmd FileType tex nmap Q :call TeX_fmt()<CR>



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

" Check Python files with flake8 and pylint.
let g:ale_linters = {'python': ['flake8']}
" " Fix Python files with autopep8 and yapf.
let g:ale_fixers = {'python': ['autopep8', 'yapf']}
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0


" ==============================================================================
" => Javascript IDE.
"
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0


" ==============================================================================
" => Rust IDE.
"
let g:rustfmt_autosave = 1


" ==============================================================================
" => Preview images.
"
:autocmd BufEnter *.png,*.jpg,*gif,*.tif exec "! /Applications/kitty.app/Contents/MacOS/kitty +kitten icat ".expand("%") | :bw
