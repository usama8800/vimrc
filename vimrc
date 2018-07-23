"SETUP STUFF {{{
set nocompatible
set hidden
let mapleader=" " " set leader to <space>
let maplocalleader="\\"
set encoding=utf-8
set backspace=indent,eol,start
syntax enable
filetype plugin indent on
set nrformats-=octal
set nrformats+=alpha
set formatoptions+=j "  Delete comment character when joining lines
set winaltkeys=no " Alt doesn't go to menu bar
set autoread
set clipboard+=unnamed
set tabpagemax=50
set undofile
set undodir=~/vimfiles/undo

call plug#begin('~/vimfiles/plugged')
Plug 'vim-airline/vim-airline'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'tpope/vim-commentary'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhartington/oceanic-next'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'sjl/gundo.vim'
call plug#end()
" }}}


" FIND FILES {{{
set ic
set path+=**
set wildmenu
set wildignore+=*/obj/*
set wildignore+=*/.git/*
set wildignore+=*/bin/*
set wildignore+=*.spec.*
set wildignore+=*desktop.ini
" :find to use
" }}}


" WINDOWS AND BROWSING {{{
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_list_hide='.*\.swp$'
" Saving and loading sessions {{{
set sessionoptions-=options
set sessionoptions+=localoptions
nnoremap <leader>s1 :mksession! ~/vimfiles/Sessions/Session1.vim<cr>
nnoremap <leader>s2 :mksession! ~/vimfiles/Sessions/Session2.vim<cr>
nnoremap <leader>s3 :mksession! ~/vimfiles/Sessions/Session3.vim<cr>
nnoremap <leader>s4 :mksession! ~/vimfiles/Sessions/Session4.vim<cr>
nnoremap <leader>s5 :mksession! ~/vimfiles/Sessions/Session5.vim<cr>
nnoremap <leader>s6 :mksession! ~/vimfiles/Sessions/Session6.vim<cr>
nnoremap <leader>s7 :mksession! ~/vimfiles/Sessions/Session7.vim<cr>
nnoremap <leader>s8 :mksession! ~/vimfiles/Sessions/Session8.vim<cr>
nnoremap <leader>s9 :mksession! ~/vimfiles/Sessions/Session9.vim<cr>
nnoremap <leader>s0 :mksession! ~/vimfiles/Sessions/Session0.vim<cr>
nnoremap <leader>l1 :source ~/vimfiles/Sessions/Session1.vim<cr>
nnoremap <leader>l2 :source ~/vimfiles/Sessions/Session2.vim<cr>
nnoremap <leader>l3 :source ~/vimfiles/Sessions/Session3.vim<cr>
nnoremap <leader>l4 :source ~/vimfiles/Sessions/Session4.vim<cr>
nnoremap <leader>l5 :source ~/vimfiles/Sessions/Session5.vim<cr>
nnoremap <leader>l6 :source ~/vimfiles/Sessions/Session6.vim<cr>
nnoremap <leader>l7 :source ~/vimfiles/Sessions/Session7.vim<cr>
nnoremap <leader>l8 :source ~/vimfiles/Sessions/Session8.vim<cr>
nnoremap <leader>l9 :source ~/vimfiles/Sessions/Session9.vim<cr>
nnoremap <leader>l0 :source ~/vimfiles/Sessions/Session0.vim<cr>
nnoremap <leader>ll :source ~/vimfiles/Sessions/LastSession.vim<cr>
function! NewSession()
	bwipeout
	e .
endfunction
function! AddDirectory(path)
	tabnew ~/vimfiles/bookmarks.txt
	execute "normal! Go" . a:path
	w
	tabclose
endfunction
function! RegexEscape(string)
	return substitute(a:string, "\\\\", "\\\\\\\\", 'g')
endfunction
function! RemoveBookmark(path)
	tabnew ~/vimfiles/bookmarks.txt
	execute "/\\v" . RegexEscape(a:path)
	normal! dd
	w
	tabclose
endfunction
nnoremap <leader>ln :call NewSession()<cr>:source $MYVIMRC<cr>:simalt ~x<cr>:e ~/vimfiles/bookmarks.txt<cr>
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <leader>bcd :call AddDirectory(expand('%:p:h'))<cr>
nnoremap <leader>dcd :call RemoveBookmark(expand('%:p:h'))<cr>
nnoremap <leader>lb :e ~/vimfiles/bookmarks.txt<cr>
function! SwapFunction(swapname)
	if a:swapname ==? fnamemodify("~\\vimfiles\\.bookmarks.txt.swp", ":p")
		return 'o'
	else
		return ''
	endif
endfunction
augroup BookmarkFile
	autocmd!
	autocmd BufRead ~/vimfiles/bookmarks.txt nnoremap <buffer> <cr> 0v$gf:cd %:p:h<cr>
	autocmd SwapExists * let v:swapchoice = SwapFunction(v:swapname)
augroup END
" }}}
augroup CustomWindows " {{{
	autocmd!
	" Open bookmarks when starting without file
	autocmd VimEnter *
				\ if getcwd() ==? 'C:\Windows\system32'
				\ 	| cd ~
				\ 	| e ~/vimfiles/bookmarks.txt
				\ 	| nnoremap <buffer> <cr> 0v$gf:cd %:p:h<cr>
				\ | endif
	autocmd VimLeave * mksession! ~/vimfiles/Sessions/LastSession.vim
augroup END " }}}
nnoremap <C-w><C-v> :vsplit .<cr>
nnoremap <C-w><C-s> :split .<cr>
set splitbelow
set splitright
" Window resizing
nnoremap <C-w>- <C-w><bar>
nnoremap <C-w><C-_> <C-w><bar>
nnoremap <C-w><C-\> <C-w>_
nnoremap <C-w><C-m> <C-w>_<C-w><bar>
nnoremap <C-Tab> :tabnext<cr>
nnoremap <C-S-Tab> :tabprevious<cr>
nnoremap <C-t> :tabnew .<cr>
nnoremap <C-F4> :tabclose<cr>
nnoremap <leader>ee :e .<cr>
nnoremap <leader>bb :buffers<cr>:buffer<space>
" Change window with CTRL-[H,J,K,L]
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
" Easier to edit and source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>:simalt ~x<cr>
nnoremap <leader>sc :w<cr>:source %<cr>
nnoremap <C-s> :w<cr>
inoremap <c-s> <esc>:w<cr>
" }}}


" APPEARENCE {{{
set number
set numberwidth=2
set relativenumber
set cursorline
set lazyredraw
set showmatch
set hlsearch incsearch
set synmaxcol=190
set display+=lastline
set sidescrolloff=5
set background=dark
colorscheme OceanicNext
set guifont=Hack:h10,PowerlineSymbols
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
let g:colorizer_auto_filetype='css'
augroup Custom_Colorizer
	autocmd!
	autocmd BufNewFile,BufRead *.css,*.html,*.htm :ColorHighlight!
augroup END
augroup Custom_Appearence
	autocmd!
	autocmd VimResized * exe "normal \<C-w>="
	autocmd GUIEnter * simalt ~x " Set fullscreen window
augroup END
augroup EnterLeaveWindowCMDs
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber foldcolumn=1
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber foldcolumn=0
augroup END
set showtabline=1 " never show tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_detect_modified=1
let g:airline_detect_paste=1
function! FoldFunction()
	if index(['vim'], &filetype) > -1 " marker list
		setlocal foldmethod=marker
	else
		setlocal foldmethod=indent
	endif
endfunction
augroup EnterLeaveWindowCMDs
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber foldcolumn=1
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber foldcolumn=0
	autocmd BufRead * call FoldFunction()
augroup END
" }}}


" FIX WHITESPACE {{{
set autoindent
set tabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set shiftround
set noexpandtab " on pressing tab
set listchars=tab:>-,space:·,trail:-,nbsp:+,extends:>,precedes:<
set list
set linebreak
set cpoptions+=n " use number line for wrapped text
let &showbreak='↳'
augroup Whitespace
	autocmd!
	autocmd BufRead * set noexpandtab
augroup END
" }}}


" File-wise mappings {{{
augroup FileWiseMaps
	autocmd!
	" CSS
	" v = value
	" p = property
	" ig = group name
	" ag = whole group
	autocmd Filetype css,scss onoremap <buffer> v :<C-u>normal! 0f:lvg_<cr><space>;<esc>i
	autocmd Filetype css,scss onoremap <buffer> p :<C-u>normal! ^vf:h<cr>
	autocmd Filetype css,scss onoremap <buffer> ig :<C-u>execute "normal! j?{\rhv0"<cr>
	autocmd Filetype css,scss onoremap <buffer> ag :<C-u>execute "normal! j?{\r0v/}\r"<cr>
	autocmd Filetype python nnoremap <buffer> <C-x> :!start cmd /c python %<cr>
augroup END
" }}}


" AUTOCOMPLETES {{{
augroup file_autocompletes
	autocmd!
	autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
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
nnoremap j gj
nnoremap k gk
nnoremap <leader>; :<up>
nnoremap x "_x
inoremap {<cr> {<cr>a<cr>}<esc>k$s
nnoremap // :let @/=""<cr>:echo "Search cleared"<cr>
nnoremap gcc :Commentary<cr>j
" Keep curson in center, zz to change
let &scrolloff=999
nnoremap zz :let &scrolloff=999-&scrolloff<cr>
" }}}


" Finding {{{
nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
	let saved_unnamed_register = @@

	if a:type ==# 'v'
		normal! `<v`>y
	elseif a:type ==# 'char'
		normal! `[y`]
	else
		return
	endif

	silent execute "grep! -R " . shellescape(@@) . " ."
	copen

	let @@ = saved_unnamed_register
endfunction
" }}}

