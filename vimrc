set nocompatible
let mapleader=","

"======================
" Vundle configuration
"======================
filetype off
filetype plugin indent on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Package (plugin) manager
Bundle 'gmarik/vundle'

" Uses '%' to match more than the usual
Bundle 'mirell/vim-matchit'

" Lets use 'tab' to complete things instead of <CTRL-P>
Bundle 'SuperTab'

" Nice buffer manager!
" mapped to <leader>b
Bundle 'sandeepcr529/Buffet.vim'
nmap <leader>b :Bufferlist<CR>

" Find files the easy way
Bundle 'git://git.wincent.com/command-t.git'

Bundle 'scrooloose/nerdtree'
nmap <leader>p :NERDTreeToggle<CR>

" Easier way navigate and learn how to navigate.
"
" To understand what this plugin does, try the following:
" type: ,,w
" check the screen and type a letter marked in red
" Got it?
"
" Mapped to:
" <leader><leader><motion>
Bundle 'Lokaltog/vim-easymotion'

" 'Solarized' color scheme. I liked it a lot
Bundle 'altercation/vim-colors-solarized'

"===============
" Look and feel
"===============

syntax enable

if !has("gui_running")
  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
    set background=dark
    colorscheme solarized
  else
    " Emergency mode. I don't like it.
    colorscheme murphy
    highlight CursorLine term=underline cterm=underline ctermbg=none
    highlight CursorColumn term=none cterm=none ctermbg=DarkGray
  endif

  " Default completion menu color is too ugly
  " let's make it a little better
  highlight Pmenu ctermbg=238 gui=bold
end

" Relative numbers on left...
set relativenumber
" ...but the current line, which uses
" the absolute number
set number

" Show unwanted spaces
set list listchars=tab:»·,trail:·

" Highlight line and column
set cursorline cursorcolumn

" Incremental search
set incsearch
set hlsearch
" Search is case sensitive only if
" there is a capital letter
set smartcase

" Clear search highlights
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" I hate wrapped lines
set nowrap

" Keep some space between the cursor
" and the edges of the screen
set scrolloff=4
set sidescrolloff=10
set sidescroll=2

" Always show status line
set laststatus=2

"================
" Behavior Fixes
"================

" Mouse works on terminal
set mouse=a
set ttymouse=xterm2

" Change buffers without saving
set hidden

" No more scattered backup and swap files
set backupdir=./.backup,~/.vim/backup//,~/_vimfiles/backup//,/tmp//,.
set directory=./.backup,~/.vim/backup//,~/_vimfiles/backup//,/tmp//,.

" No annoying beeps
set noerrorbells visualbell t_vb=

" Don't continue comments
set formatoptions-=o

" Make Y consistent with C and D
nnoremap Y y$

" Better backspacing
set backspace=indent,eol,start

" Prevents show matches when reload vimrc
:nohls

" New splits open _below_ the current one,
" default is to open above o_O
set splitbelow
" New splits open to the _right_ of the current one,
" default is to open left o_O
set splitright

"---------------------------------------------
" SUGAR MODE
"
" This remaps several Vim keys to work like
" most editors.
"
" They are really nice to 'lower the bar' and
" make you feel productive in the beginning.
" However, if you rely to much on them, you
" will miss the best part of Vim because you
" will never learn properly about 'modes'.
"
" Delete them (or forget about them) as soon
" as you get used to 'normal' and 'insert'
" modes.
"---------------------------------------------

" CTRL-S is a vice... let's make it do
" what it is supposed to do.
" HOWEVER, in terminal, <CTRL-S> freezes it.
"
" To avoid it, add the following line to your
" .bashrc:
" stty stop undef
"
" If your terminal freezes, you can unfreeze it
" with <CTRL-Q>
nmap     <C-S> :w<CR>
vnoremap <C-S> <C-C>:w<CR>
inoremap <C-S> <C-O>:w<CR>

" This configuration has no wrapped lines
" by default. However, if you want them
" wrapped this will minimize the 'suprise'
" when you walk through them.

" Down
nmap j gj
nmap <DOWN> gj
vmap <DOWN> gj
vmap <S-DOWN> gj
imap <DOWN> <ESC>gja

" Up
nmap k gk
nmap <UP> gk
vmap <UP> gk
vmap <S-UP> gk
imap <UP> <ESC>gka

" Making visual selection a little more
" intuitive to non-initiates ;)
nmap <S-RIGHT> v<RIGHT>
nmap <S-LEFT> v<LEFT>
nmap <S-DOWN> v<DOWN>
nmap <S-UP> v<UP>

" <CTRL-C> and <CTRL-V> working as expected.
" That helps until you get 'y', 'p', and
" registers.
vmap <S-DELETE> "+d
vmap <C-X> "+d

vmap <C-INSERT> "+y
vmap <C-C> "+y

vmap <S-INSERT> "+p
vmap <C-V> "+p
imap <S-INSERT> <C-R>+
nmap <S-INSERT> "+P

" Not a good idea to remap AFTER you got used to
" macros and g//normal =\
" imap <C-V> <C-R>+

" It's a really bad idea to override this
" since it's used to vertical selection
" nnoremap <C-V> "+P

"============================================
" 'EMPOWER' SECTION
"
" Everything is this section can be safely
" removed.
" You should add things here as you learn OR
" put things you like.
"============================================

"---------------------------------------
" 'Empower' plugins...
"
" I really recommend you to check the ones here:
" https://github.com/gmarik/vimfiles/blob/1f4f26d42f54443f1158e0009746a56b9a28b053/vimrc#L136
" https://github.com/mutewinter/dot_vim
"---------------------------------------

" Add, change or remove surround chars or tags
" ys<motion>) Add surrounding parenthesis
" cs)]        Change surrounding parenthesis to brackets
" ds)         Remove surrounding parenthesis
" Also works with html tags
Bundle 'tpope/vim-surround'

" Make ascii tables
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
" To tabularize things separated by '|', use:
" :Tab /|
Bundle 'godlygeek/tabular'
nmap <leader>tt :Tab /\|<CR>

" Coffee script, if you like it (I do!) (http://coffeescript.org/)
Bundle 'vim-coffee-script'
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" Slim templates (http://slim-lang.com/)
Bundle 'slim-template/vim-slim'

"------------------------
" 'Empower' Key mappings
"------------------------

" Remove trailing spaces
nmap <leader>rt :%s/\s\+$//e<CR>

" Toogle wrap lines
nmap <leader>wl :set wrap!<CR>

" Making the most used navigation keys easier to type
" Jump to position with '
nnoremap ' `
" Jump to line with `
nnoremap ` '
