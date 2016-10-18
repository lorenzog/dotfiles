" Configuration file for vim

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing
" Now we set some defaults for the editor 
set autoindent		" always set autoindenting on
filetype plugin indent on
" but also
" set indentkeys-=o
" (to disable indent on CR

" commented out next 2 lines to enable pathogen
":filetype on
":autocmd FileType c,cpp :set cindent
"set textwidth=79		" Wrap at 80
set linebreak 		" wrap at word boundary
set nobackup		" Don't keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

set showcmd			" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set incsearch		" Incremental search
nmap <silent> ,/ :nohlsearch<CR>
set smartcase " if a char is typed uppercase, forget about ignoresearch
set nows " no wrap search

set autowrite		" Automatically save before commands like :next and :make

"set mousemodel=extend 	" shift + left search the word under cursor ahead, shift + right backwards

" set incsearch		" move the cursor to matching string
set hlsearch
"set nohlsearch		" disable highlighting showing
" make ctrl-l redraw screen and remove highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>
set laststatus=2	" 2 status lines
set shortmess=a		" avoid "hit ENTER to continue" message
set number			" line numbering

set foldmethod=indent	" enables folding
set foldlevel=99		" open all folds

set shm=at

"set formatoptions=tcqlron
" 'c' is for automatically inserting comments
set formatoptions=tqcr

set wildmode=longest,list
colorscheme greens

" create tags with ctags -R (dirs..)
" look up until $HOME BEST TIP EVER
set tags=./tags;$HOME

set autochdir

" the scroll wheel on console!! my life is awesome right now
set mouse=a
" set mouse-=a to select with mouse
"set ttymouse=xterm
" yank to system clipboard
" set clipboard=unnamed,unnamedplus
" fix in tmux 
" see http://bombayrain.posterous.com/tmux-and-vim-configuration
" don't forget to do ':setw -g xterm-keys on' in tmux
" to type those, do ctrl-v-pgup and erase the 5, so [5;5~ becomes [5;*~
"set t_kN=[6;*~
"set t_kP=[5;*~

" mark text beyond 80th column
"syn match Error /\%81v.*/
"
"augroup vimrc_autocmds
"    autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"    autocmd BufEnter * match OverLength /\%74v.*/
"augroup END


" colour for tabs
:hi TabLineSel ctermfg=Red

" fullpath
" see also
" http://got-ravings.blogspot.co.uk/2008/08/vim-pr0n-making-statuslines-that-own.html
set statusline=%F\ [%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" wow: http://nvie.com/posts/how-i-boosted-my-vim/
let mapleader=","
set list
" highlight trailing spaces, etc.
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" but not in xml
"autocmd filetype html,xml set listchars-=tab:>.

" show line endings
" set listchars+=eol:$

" keep the end-of-line as it is
:let g:PreserveNoEOL = 1

" cursor line
"set cul

" lines before the end when page scrolls
set scrolloff=3

" tag navigation with tabs
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

let g:pymode_options = 0
" let g:pymode_lint_ignore = "E501, W404"
" red column at max_line_length
"let g:pymode_options_colorcolumn = 1
" set wrap

" split new window on right or below
set splitbelow
set splitright

" red marker at col 110
set colorcolumn=110
set background=dark

" http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" python stuff
" I normally git clone pathogen in ~lib then symlink to .vim/
call pathogen#infect()
call pathogen#helptags()
autocmd BufWritePost *.py call Flake8()
"let g:flake8_show_in_file=1  " show marks in file
"let g:flake8_show_in_gutter=1  " show tips in gutter

autocmd FileType python :set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
autocmd FileType python :set errorformat=%f:%l:\ %m
autocmd Filetype python set tabstop=8
autocmd Filetype python set softtabstop=4
autocmd Filetype python set shiftwidth=4
autocmd Filetype python set expandtab		" convert tabs to spaces
autocmd Filetype python set shiftround


autocmd BufNewFile,BufRead *.notes set syntax=markdown
autocmd BufNewFile,BufRead *.notes set filetype=markdown

" XML has 2
autocmd FileType xml :setlocal sw=2 ts=2 sts=2 " Two spaces for XML files "
autocmd FileType xsd :setlocal sw=2 ts=2 sts=2 " Two spaces for XML files "
autocmd FileType xml :set noexpandtab
autocmd FileType xsd :set noexpandtab

au BufRead,BufNewFile *.ino set syntax=arduino
au BufRead,BufNewFile *.pde set syntax=arduino
"autocmd BufWritePost *.ino call 

au BufRead,BufNewFile *.md setlocal textwidth=72
au BufRead,BufNewFile *.rst setlocal textwidth=72

