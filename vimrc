" SET VIM (NOT VI) {{{
set nocompatible
set hidden
" }}}


" ENABLE SYNTAX {{{
set encoding=utf-8
syntax enable
filetype plugin indent on
" }}}


" FIND FILES {{{
set ic
set path+=**
set wildmenu
set wildignore+=*/obj/*
set wildignore+=*/.git/*
set wildignore+=*/bin/*
" :find to use
" }}}


" WINDOWS AND BROWSING {{{
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_list_hide=netrw_gitignore#Hide().'.*\.swp$'
augroup CustomWindows
	autocmd!
	autocmd VimEnter * if expand("%") == "" && argc() == 0 && (v:servername =~ 'GVIM\d*' || v:servername == "") | e . | endif
augroup END
nnoremap <C-w><C-v> :vsplit .<cr>
nnoremap <C-w><C-s> :split .<cr>
set splitbelow
set splitright
nnoremap <C-w><C--> <C-w>_
nnoremap <C-w><C-\> <C-w><bar>
nnoremap <C-w><C-m> <C-w>_<C-w><bar>
" }}}


" VIM-PLUG {{{
call plug#begin('~/vimfiles/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'tomtom/tcomment_vim'
call plug#end()
" }}}


" APPEARENCE {{{
set number " Line numbers
set numberwidth=2
set relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
colorscheme gruvbox
set background=dark
set guifont=Hack:h10,PowerlineSymbols:h10
let g:colorizer_auto_filetype='css'
augroup Custom_Colorizer
	autocmd!
	autocmd BufNewFile,BufRead *.css,*.html,*.htm :ColorHighlight!
augroup END
set hlsearch incsearch
nnoremap <cr> :nohlsearch<cr><cr>
augroup Custom_Appearence
	autocmd!
	autocmd GUIEnter * simalt ~x " Set fullscreen window
augroup END
set showtabline=0 " never show tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_detect_modified=1
let g:airline_detect_paste=1
" }}}


" FIX WHITESPACE {{{
set autoindent
set tabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set shiftround
set noexpandtab " on pressing tab, insert 4 spaces
set listchars=tab:>-,space:·
set list
set linebreak
set cpo+=n
let &showbreak='↳'
" }}}


" FOLD SETTINGS {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


" AUTOCOMPLETES {{{
augroup file_autocompletes
	autocmd!
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
augroup END
iabbrev @! usama8800@gmail.com
iabbrev @@ usama@bu.edu
cabbrev f find
" snippets
nnoremap ,html :read $HOME/vimfiles/snippets/base.html<CR>G4kA
" }}}


" Use it the Vim way {{{
inoremap jk <esc>
inoremap kj <esc>
inoremap <esc> <nop>
noremap <Left> <nop>
inoremap <Left> <nop>
noremap <Right> <nop>
inoremap <Right> <nop>
noremap <Up> <nop>
inoremap <Up> <nop>
noremap <Down> <nop>
inoremap <Down> <nop>
" }}}


" Format on save {{{
augroup formatter
	autocmd!
	autocmd BufWritePre * :normal! mqgg=G`q
	if &filetype==''
		autocmd!
	endif
augroup END
" }}}


" MISC {{{
nnoremap / /\v
nnoremap <C-s> :w<cr>
" Keep curson in center, zz to change
let &scrolloff=999
nnoremap zz :let &scrolloff=999-&scrolloff<cr>
" Change window with CTRL-[H,J,K,L]
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
set winaltkeys=no " Alt doesn't go to menu bar
let mapleader=" " " set leader to <space>
let maplocalleader="\\"
" Easier to edit and source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}
