" Mappings example for use with gdb
" Maintainer:	<xdegaye at users dot sourceforge dot net>
" Last Change:	Mar 6 2006

if ! has("gdb")
    finish
endif

let s:gdb_k = 1
nmap <F7> :call <SID>Toggle()<CR>

" Toggle between vim default and custom mappings
function! s:Toggle()
    if s:gdb_k
	let s:gdb_k = 0

	if ! exists("g:vimgdb_debug_file")
		let g:vimgdb_debug_file = ""
	elseif g:vimgdb_debug_file == ""
		call inputsave()
		let g:vimgdb_debug_file = input("File: ", "", "file")
		call inputrestore()
	endif
	call gdb("file " . g:vimgdb_debug_file)


	" nmap <space> q:acall gdb("")<Esc><Left>i
	map <Space> :call gdb("")<CR>
	imap <C-t> target remote 127.0.0.1:1234<Esc><CR>
	nmap <silent> <C-Z> :call gdb("\032")<CR>

	nmap <silent> B :call gdb("info breakpoints")<CR>
	nmap <silent> L :call gdb("info locals")<CR>
	nmap <silent> A :call gdb("info args")<CR>
	nmap <silent> <C-0> :call gdb("step")<CR>
	" nmap <silent> I :call gdb("stepi")<CR>
	nmap <silent> <C-9> :call gdb("next")<CR>
	nmap <silent> X :call gdb("nexti")<CR>
	nmap <silent> F :call gdb("finish")<CR>
	nmap <silent> R :call gdb("run")<CR>
	nmap <silent> Q :call gdb("quit")<CR>
	nmap <silent> <C-8> :call gdb("continue")<CR>
	nmap <silent> W :call gdb("where")<CR>
	nmap <silent> <C-2> :call gdb("backtrace")<CR>
	nmap <silent> <C-y> :call gdb("0.1:1234")<CR>
	" nmap <silent> <C-U> :call gdb("up")<CR>
	" nmap <silent> <C-D> :call gdb("down")<CR>

	" set/clear bp at current line
	nmap <silent> <C-1> :call <SID>Breakpoint("break")<CR>
	nmap <silent> <C-E> :call <SID>Breakpoint("clear")<CR>

	" print value at cursor
	nmap <silent> <C-P> :call gdb("print " . expand("<cword>"))<CR>

	" display Visual selected expression
	vmap <silent> <C-P> y:call gdb("createvar " . "<C-R>"")<CR>

	" print value referenced by word at cursor
	nmap <silent> <C-X> :call gdb("print *" . expand("<cword>"))<CR>

	echohl ErrorMsg
	echo "gdb keys mapped"
	echohl None

    " Restore vim defaults
    else
	let s:gdb_k = 1
	call gdb("quit")
	nunmap <Space>
	nunmap <C-Z>

	nunmap B
	nunmap L
	nunmap A
	nunmap <C-1>
	nunmap <C-2>
	nunmap <C-8>
	nunmap <C-9>
	nunmap <C-0>
	nunmap I
	nunmap X
	nunmap F
	nunmap R
	nunmap Q
	nunmap W

	nunmap <C-E>
	nunmap <C-P>
	nunmap <C-X>
	nunmap <C-t>

	echohl ErrorMsg
	echo "gdb keys reset to default"
	echohl None
    endif
endfunction

" Run cmd on the current line in assembly or symbolic source code
" parameter cmd may be 'break' or 'clear'
function! s:Breakpoint(cmd)
    " An asm buffer (a 'nofile')
    if &buftype == "nofile"
	" line start with address 0xhhhh...
	let s = substitute(getline("."), "^\\s*\\(0x\\x\\+\\).*$", "*\\1", "")
	if s != "*"
	    call gdb(a:cmd . " " . s)
	endif
    " A source file
    else
	let s = "\"" . fnamemodify(expand("%"), ":p") . ":" . line(".") . "\""
	call gdb(a:cmd . " " . s)
    endif
endfunction

" map vimGdb keys
" call s:Toggle()
