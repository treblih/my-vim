" 09.11.12
" armx86@gmail.com

if has("gui_running")
 	" source ~/.vim/session.vim
        " ugly Chinese chars
	"set guifont=fixed\ 10
        " friendly to Chinese chars
	set guifont=mono\ 9
	" hide scrollball(r), menubar, toolbar
	set guioptions-=r
	set guioptions-=L
	set guioptions-=m
	set guioptions-=T

	"colorscheme halight
	"colorscheme darkspectrum
	"colorscheme fine_blue
	"colorscheme fruit

	" toggle menu and toolbar
	map <silent> <F12> :if &guioptions =~# 'T' <Bar>
		\set guioptions-=T <Bar>
		\set guioptions-=m <Bar>
	    \else <Bar>
		\set guioptions+=T <Bar>
		\set guioptions+=m <Bar>
	    \endif<CR>
endif 
colorscheme tango2

let mapleader = ","
let g:mapleader = ","
" auto-popup for snipMate, as the key-conflict of TAB
let g:acp_behaviorSnipmateLength = 1
" Use C_GNU syntax highlight
let c_gnu = 1

syntax          enable
filetype        plugin on
" auto indent when meet with different filetype
filetype        indent on
autocmd FileType c set omnifunc=ccomplete#Complete

" Just for c_gnu
hi gnu		guifg=#D0517C gui=bold

"set tags+=~/.vim/c-support/wordlists/tags

" 3 env:
" encoding(enc): display mechanism no matter what encoding it is original
"                same with sys locale
" fileencoding(fenc): change & save to change encoding of the target file
"                     :set fenc=utf-8 :w
"                     :set fenc? to check what is
" fileencodings(fencs): guess list when opening a file
set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,ucs-bom,cp936,utf-16
set mouse=a
set so=7
set cmdheight=1
set backspace=eol,start,indent
" No compatible with VI
set nocompatible
set autoread
set wildmenu
set ruler
set nu
" set ignorecase
set incsearch
set magic
set noerrorbells
set novisualbell
set hlsearch
set showmatch
set nobackup
set nowb
set noswapfile

set autoindent
set smartindent
set smarttab
set expandtab
" indent
set shiftwidth=4
" use spaces to fill tab
set softtabstop=4

set lbr
set tw=500
set ai
set si
set cindent
set wrap
set mat=2
"set dictionary=/usr/share/dict/cracklib-small

" Set session, viminfo
" rviminfo ~/.vim/zy.viminfo

" status line's format
set laststatus=2
  function! CurDir()
     let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
     return curdir
  endfunction
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L\ \ \ Col:\ %c


" in visual-mode
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $w <esc>`>a"<esc>`<i"<esc>
vnoremap /? <esc>`>a */<esc>`<i/* <esc>
vnoremap if <esc>`>a<CR>#endif<esc>`<O#if 0<esc>
vnoremap de <esc>`>a<CR>#endif<esc>`<O#ifndef<CR>#define

" in insert-mode
inoremap $1 ()<esc>:let leavechar=")"<CR>i
inoremap $2 []<esc>:let leavechar="]"<CR>i
inoremap $3 {}<esc>:let leavechar="}"<CR>i
inoremap $4 {<esc>o}<esc>:let leavechar="}"<CR>O
inoremap $5 <><esc>:let leavechar=">"<CR>i
inoremap $q ''<esc>:let leavechar="'"<CR>i
inoremap $w ""<esc>:let leavechar='"'<CR>i
inoremap /? /*  */<esc>:let leavechar="/"<CR>hhi

" for new features in VIM 7.X, we have TAB
map <A-n> :tabn<CR>
map <A-p> :tabp<CR>
noremap <S-Tab> :tabf!<Space>

" for Taglist
" map <leader>t  :Tlist<CR>

" spell check
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" for ,+...
map <leader>q :q!<CR>
map <leader>, :w<CR>
map <leader>ct :!ctags -R --fields=+lS<CR>
map <leader>a :!./a.out<CR>

" % -> current file
autocmd FileType c map <buffer><silent><leader>gcc :w<CR>:!gcc -Wall -g -std=gnu99 % 2> %.gcc<CR>:cf! %.gcc<CR>:copen<CR>
autocmd FileType c map <buffer><silent><leader>in :w<CR>:!indent -linux %<CR>:cf! %<CR>
autocmd FileType c map <buffer><silent><leader>fl :!flawfinder -DQ % > flaw.out<CR>
autocmd FileType tex map <buffer><silent><leader>pdf :!pdflatex %<CR>
autocmd FileType tex map <buffer><silent>tt $3a\tt <ESC>

" map <leader>g :!gcc -Wall %<CR>		
map <leader>d :!./dip<CR>

map <leader>e :e!  ~/.vimrc<CR>
" auto reload ~/.vimrc
autocmd! bufwritepost ~/.vimrc source ~/.vimrc
map <leader>s :source! ~/.vim/vimrc<CR>

" Read errorfile in QuickFix window
map <leader>f :cf! flaw.out<CR>:copen<CR>

map <leader><space> :!

" focus on diff windows
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-u> <C-W>j
map <C-i> <C-W>k

" big step to up'n down
map <C-j> <PageDown>
map <C-k> <PageUp>

" after typing :!mak , locate compiling errors
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" i don't like SHIFT-; -> :
map <Space> :

" just try them, u'll know their functions
" change to another file in current tab, forced
map     <F1> :args!<Space>
" func invocation quick fill
imap    <F1> ();<Esc>hi
" toggle HighLight
map     <F2> :set hls! hls?<CR>
" func declaration quick fill
imap    <F2> ()<CR>$4

" Toggle Taglist
nnoremap <silent> <F3> :Regrep<CR>
" close a window
map     <F4> :close<CR>
" global substitution
map     <F5> :%s//g<left><left>
" i like vsplit rather than split
map     <F8> :split 
" quickly change tags, just 4 ctags
map     <F10> :set tags=~/tags<left><left><left><left>
" quick comment
" map     <F12> i/*<Esc>ea*/<Esc>

" my info
iab myd <c-r>=strftime("%d.%m.%y   %H:%M:%S")<CR>
iab myn Zhang Yang

" for ASM(AT&T)
iab pu push<Tab>%
iab po pop<Tab>%
iab #- #------------------------------------------------------------------
iab __ __asm__ __volatile__<F1>$w
iab nt \n\t<Esc>la<Tab>\<CR>

" for C
"noremap <C-i> aint<CR>main$1<Esc>o$4<CR>return<Space>0;<Esc>kko
iab %i %include $w
iab #i #include
iab #d #define
iab /** /****************************************************************
iab fu  <bs>)<Esc>^wi<bs>(<Esc>o$4
iab ))  <bs>)<Esc>^wi(<Esc>A $4
iab pr printf$1$w<Esc>A;<Esc>hhi
iab ty typedef struct $4
":iab sw <bs>)<Esc>Iswitch (<Esc>o$4case :<Enter>break;<Enter>case :<Enter>break;<Enter>break;default:<Enter>break;<Esc>8ka
":iab } <Esc>/}<CR>a

":nnoremap <buffer> <CR> Oye<C-W>w:tag <C-R>"<CR>

" quick comment or de-comment
vmap B <Esc>^xxx$xxx
vmap V <Esc>I/* <Esc>A */<Esc>
"""vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>


" for GDB
set previewheight=12				" set gdb window initial height
" nmap <F7> :run /macros/gdb_mappings.vim	" source key mappings listed in this document<CR>
" set gdbprg=gdb					" set GDB invocation string (default 'gdb')
" let g:vimgdb_debug_file = ""
" run macros/gdb_mappings.vim 

" Auto change work dir to current dir. But if we toggle it, we wonldn't use TAGS to jump arbitrarily
" autocmd BufEnter * cd %:p:h

" change DIR to /home/jedi
" cd ~

" for txt.vim
au BufRead,BufNewFile *.txt setlocal ft=txt 

let g:winManagerWindowLayout='TagList'
nmap mm :WMToggle<cr>

" for cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
" generate data files
nmap <silent><leader>csc :!cscope -Rbqk<CR>
" connection
nmap <silent><leader>cka :cs kill 0<CR>:cs add cscope.out<CR>
" quick binding
nmap <A-s> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <A-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <A-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <A-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <A-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <A-f> :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <A-i> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <A-d> :cs find d <C-R>=expand("<cword>")<CR><CR>

map ast <Esc>:%! astyle<CR>
