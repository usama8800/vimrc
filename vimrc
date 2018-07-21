" SET VIM (NOT VI) {{{
set nocompatible
set hidden
let mapleader=" " " set leader to <space>
let maplocalleader="\\"
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
set wildignore+=*.spec.*
set wildignore+=*desktop.ini
" :find to use
" }}}


" WINDOWS AND BROWSING {{{
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_list_hide='.*\.swp$'
augroup CustomWindows " {{{
	autocmd!
	" Open netrw when start from directory
	autocmd VimEnter *
				\ if getcwd() ==? 'C:\Windows\system32'
				\ 	| cd ~/Documents
				\ | endif
	autocmd VimEnter *
				\ if expand("%") == ""
				\ 	&& argc() == 0 && (v:servername =~ 'GVIM\d*' || v:servername == "")
				\ 	| echom getcwd()
				\ 	| e .
				\ | endif
	" Open last session when start from Start
	" autocmd VimEnter *
	" 			\ if getcwd() == 'C:\WINDOWS\system32'
	" 			\ && filereadable(expand("~/vimfiles/Sessions/LastSession.vim"))
	" 			\ 	| so ~/vimfiles/Sessions/LastSession.vim
	" 			\ 	| simalt ~x
	" 			\ | endif
	autocmd VimLeave * mksession! ~/vimfiles/Sessions/LastSession.vim
augroup END " }}}
" Saving and loading sessions {{{
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
nnoremap <leader>ln :call NewSession()<cr>:source $MYVIMRC<cr>:simalt ~x<cr>
" }}}
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


" VIM-PLUG {{{
call plug#begin('~/vimfiles/plugged')
Plug 'vim-airline/vim-airline'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'tomtom/tcomment_vim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhartington/oceanic-next'
call plug#end()
" }}}


" APPEARENCE {{{
set number " Line numbers
set numberwidth=2
set relativenumber
set cursorline
set lazyredraw
set showmatch
set hlsearch incsearch
augroup EnterLeaveWindowCMDs
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber foldcolumn=2
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber foldcolumn=0
augroup END
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
set showtabline=1 " never show tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
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


" File-wise mappings {{{
augroup FileWiseMaps
	autocmd!
	" CSS
	" v = value
	" p = property
	" ig = group name
	" ag = whole group
	autocmd Filetype css,scss onoremap v :<C-u>normal! 0f:lvg_<cr><space>;<esc>i
	autocmd Filetype css,scss onoremap p :<C-u>normal! ^vf:h<cr>
	autocmd Filetype css,scss onoremap ig :<C-u>execute "normal! j?{\rhv0"<cr>
	autocmd Filetype css,scss onoremap ag :<C-u>execute "normal! j?{\r0v/}\r"<cr>
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
nnoremap j gj
nnoremap k gk
nnoremap <leader>; :<up>
nnoremap x "_x
inoremap {<cr> {<cr>a<cr>}<esc>k$s
nnoremap // :let @/=""<cr>
" Keep curson in center, zz to change
let &scrolloff=999
nnoremap zz :let &scrolloff=999-&scrolloff<cr>
set winaltkeys=no " Alt doesn't go to menu bar
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

