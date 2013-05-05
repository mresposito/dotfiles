" My personal .vimrc file!
" Mantained by Michele Esposito <micheleresposito@gmail.com>
" Good post
" http://statico.github.com/vim.html
"""""""""""""""""""""""""""""""""""""""""
" GENERAL SETTINGS!!!
"""""""""""""""""""""""""""""""""""""""""

set nocompatible                  " Must come first because it changes other options.

call pathogen#infect()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set guioptions-=T                 " hide toolbar
set fillchars=                    " emply splitbars
set guifont=Inconsolata:h13       " set font

set encoding=utf-8
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set laststatus=2                  " Show the status line all the time

"" COMPLETION""
set complete=.,b,u,]
set wildmenu                      " Enhanced command line completion.
set completeopt=menu,preview
set wildmode=longest,list
" set completeopt=menu            " Don't show extra info on completions
set wildignore+=*.o,*.obj,*.pyc,*.class  " Hide irrelevent matches

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set rnu                           " relative line numbering
setglobal relativenumber

set number                        " Show line numbers.
set ruler                         " Show cursor position.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set title                         " Set the terminal's title
set visualbell                    " No beeping.

set autoread                      " automatically reloads a file"
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile
set directory=$HOME/.vim/tmp      " Keep swap files in one location

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set smarttab                      " insert tabs on the start of a line according to
                                  "    shiftwidth, not tabstop

set history=1000                  " remember more commands and search history
set undolevels=1000    
set timeoutlen=500                " Lower timeout for mappings

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>           

" Useful status information at bottom of screen
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Or use vividchalk

if has( "gui_macvim")
  colorscheme softchalk
else
  colorscheme greenchalkTerm
endif

"""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""""""""""""""""""""
" replay last macro
map Q @@

" change directory to current open file
noremap ,d :lcd %:p:h<CR>

" fast jump between files
noremap ,e :e#<CR>

" quick shortcut
noremap <silent> ,o :!open assignment.pdf<CR><CR>

" fast jumps
noremap <Up>   g;
noremap <Down> g,
noremap <S-Tab> <C-o>
noremap ,j :jumps<CR>

"better visual
vnoremap < <gv
vnoremap > >gv

" fast splittiong
noremap ,v :vs<CR>
noremap ,h :sp<CR>

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" remap for easier split window navigation
noremap <C-h> <C-w>h
noremap <C-t> <C-w>j
noremap <C-n> <C-w>k
noremap <C-l> <C-w>l

" remap for an easier navigation between sigle lines.
noremap j gj
noremap k gk

" Space to toggle folds.
nnoremap - za
vnoremap - za

" fast indentation
noremap + 5= 

" better shortcuts for spell check
noremap <right> ]s
noremap <left> [s

" fast navigation
noremap K <S-Up>
noremap J <S-Down>

" deselect highlight
nmap <silent> ,/ :nohlsearch<CR>

" Quick yanking to the end of the line
nmap Y y$p

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

map ,- :w <CR>!clear <CR>:!python % <CR>


"""""""""""""""""""""""""""""""""""""""""
" Plugins Settings
"""""""""""""""""""""""""""""""""""""""""
noremap <F2> :ConqueTerm /bin/zsh<CR>

" ************ Ack-Grep Settings **********
nnoremap ,sa          :Ack<Space>

" ********** Gundo    Settings *************
nnoremap ,1 :GundoToggle<CR>

" ********** NERDTree Settings ************
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=1
map <F1> :NERDTreeToggle<CR>        " toggle NERD tree

" ************************* Command-T *******************************
if has( "gui_macvim")
  nnoremap ,t             :CommandT<CR>
  nnoremap ,b             :CommandTBuffer<CR>
else
  nnoremap ,t             :CtrlP<CR>
  nnoremap ,b             :CommandTBuffer<CR>
endif

set ttimeoutlen=50

" ************************* Ctrl-P *******************************
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'line', 'changes', 'undo']

let g:ctrlp_working_path_mode = 0
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlpcache/'
let g:ctrlp_open_multiple_files = '2vr'
let g:ctrlp_follow_symlinks = 0
let g:ctrlp_switch_buffer = 0
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*  " Linux/MacOSX impacts other plugins too
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.jpg$\|\.sw[po]$\|\.jpeg$\|\.png$\|\.mov$\|\.flv$\|\.tiff$\|\.tga$\|__Tagbar__$\|cscope.out$\|\.class$\|tags$\|\.defines$\|\.clang_complete$\|\.DS_Store$',
      \ }

if has("mac")
  let g:ctrlp_buftag_ctags_bin = '/usr/local/bin/ctags'
endif
"let g:ctrlp_map = '<c-p>'

nnoremap ,r             :CtrlPMRU<CR>
nnoremap ,q             :CtrlPQuickfix<CR>
nnoremap ,g             :CtrlPBufTag<CR>

nnoremap ; :CtrlPBuffer<CR>

nnoremap ,za            :CtrlPTag<CR>
nnoremap ,zh            :CtrlPChange<CR>

" ************************* Tags   ****************************
nnoremap ,l           :TagbarOpenAutoClose<CR>

let g:tagbar_left=1
let g:tagbar_width=25
let g:tagbar_compact=1

if has("mac")
  let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
  set csprg=/usr/local/bin/cscope
endif

" ********************* Lusty  ****************
map ,f :LustyBufferExplorer<CR>
map ,x :LustyFilesystemExplorerFromHere<CR>

"
" ************************* C, C++ Settings *****************************
iab cerr      std::cerr <<
iab cout      std::cout <<
iab endl      << std::endl;

" ************************* Power line *******************************
let g:Powerline_symbols = 'unicode'


" ************************ Tabularize ***********************
if exists(":Tabularize")
    nmap ,a= :Tabularize /=<CR>
    vmap ,a= :Tabularize /=<CR>
    nmap ,a: :Tabularize /:\zs<CR>
    vmap ,a: :Tabularize /:\zs<CR>
endif
" ************************* ZoomWin! ****************************
noremap ,z    :ZoomWin<CR>

" ************************* Syntastic! ****************************

let g:syntastic_python_checker = 'pylint'
map ,2 :SyntasticToggleMode<CR>

" ************************* Compiling options ****************************
if has("mac")
    nnoremap ,dmm             :set makeprg=make\ -j4\ -C\ ~/makeDebug
  else
    nnoremap ,dmm             :set makeprg=make\ -j4\ -C\ ~/debug
endif

nmap ,c           :source ~/.vim/compile/externalcompile.sh<CR>
let g:vimsh_prompt_override = 1               "  will use normal prompt from your 'real' shell
let g:vimsh_prompt_pty      = "%m%#"          "  specify overriden prompt
let g:vimsh_split_open      = 1               "  run vimsh in the current buffer
let g:vimsh_sh              = "/bin/zsh"      "  shell to run within vimsh

"""""""""""""""""""""""""""""""""""""""""
" SPELL CHECKING
""""""""""""""""""""""""""""""""""""""""" 
if v:version >= 700
    "Sets in-line spellchecking
    " set spell
 
    " Set local language 
    setlocal spell spelllang=en_us
    "setlocal spell spelllang=da

endif
"""""""""""""""""""""""""""""""""""""""""
" Syntax
"""""""""""""""""""""""""""""""""""""""""
au! BufRead,BufNewFile *.json set filetype=json

"""""""""""""""""""""""""""""""""""""""""
" LATEX!
"""""""""""""""""""""""""""""""""""""""""
" Settings for latex-suite

" Used for Vim Latex

" let g:AutoClosePairs_add = "$ "
let g:AutoClosePairs_del = "`"

let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*
let g:Tex_leader = ','

" Correct some spelling mistakes
ia teh the
ia htis this
ia tihs this
ia eariler earlier
ia funciton function
ia funtion function
ia fucntion function
ia retunr return
ia reutrn return
ia foreahc foreach
ia !+ !=
ca eariler earlier
ca !+ !=
ca ~? ~/
