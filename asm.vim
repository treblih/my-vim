" Vim syntax file
" Language:	GNU Assembler
" Maintainer:	Kevin Dahlhausen <kdahlhaus@yahoo.com>
" Last Change:	2002 Sep 19

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore


syn keyword asmReg	al ax eax
syn keyword asmReg	bl bx ebx 
syn keyword asmReg	cl cx ecx
syn keyword asmReg	dl dx edx
syn keyword asmReg	si esi di edi
syn keyword asmReg	bp ebp sp esp
" syn keyword asmReg	

syn keyword asmSeg	cs ds es gs fs gs ss
syn keyword asmCeg	cr0 cr1 cr2 cr3 cr4

syn keyword asmOpt	mov movb movw movl
syn keyword asmOpt	add addb addw addl
syn keyword asmOpt	sub subb subw subl
syn keyword asmOpt	mul mulb mulw mull
syn keyword asmOpt	div divb divw divl
syn keyword asmOpt	inc incb incw incl
syn keyword asmOpt	dec decb decw decl
" syn keyword asmOpt	 

syn keyword asmOpt	and andb andw andl
syn keyword asmOpt	 or  orb  orw  orl
syn keyword asmOpt	xor xorb xorw xorl
syn keyword asmOpt	not
syn keyword asmOpt	 in  inb  inw  inl
syn keyword asmOpt	out outb outw outl
" syn keyword asmOpt	 
" syn keyword asmOpt	 
syn keyword asmOpt	push pushl puahad
syn keyword asmOpt	 pop  popl  popad 

syn keyword asmOpt	div divb divw divl
syn keyword asmOpt	lgdt lldt lidt ltr
syn keyword asmOpt	sgdt sldt sidt str
syn keyword asmOpt	call lcall jmp ljmp
syn keyword asmOpt	ret iret lret
syn keyword asmOpt	lea cli sti cld std

syn match asmKey  "\.set"
syn match asmKey  "\.equ"
syn match asmKey  "\.code"
syn match asmKey  "\.data"

" storage types
syn match asmType "\.long"
syn match asmType "\.ascii"
syn match asmType "\.asciz"
syn match asmType "\.byte"
syn match asmType "\.double"
syn match asmType "\.float"
syn match asmType "\.hword"
syn match asmType "\.int"
syn match asmType "\.octa"
syn match asmType "\.quad"
syn match asmType "\.short"
syn match asmType "\.single"
syn match asmType "\.space"
syn match asmType "\.string"
syn match asmType "\.word"

syn match asmLabel		"[a-z_][a-z0-9_]*:"he=e-1
syn match asmIdentifier		"[a-z_][a-z0-9_]*"

" Various #'s as defined by GAS ref manual sec 3.6.2.1
" Technically, the first decNumber def is actually octal,
" since the value of 0-7 octal is the same as 0-7 decimal,
" I prefer to map it as decimal:
syn match decNumber		"0\+[1-7]\=[\t\n$,; ]"
syn match decNumber		"[1-9]\d*"
syn match octNumber		"0[0-7][0-7]\+"
syn match hexNumber		"0[xX][0-9a-fA-F]\+"
syn match binNumber		"0[bB][0-1]*"


syn match asmSpecialComment	";\*\*\*.*"
syn match asmComment		";.*"hs=s+1

" add myself
syn match asmComment		"#.*"
syn match asmComment		"\/\*.*\*\/"

syn match asmInclude		"\.include"
syn match asmCond		"\.if"
syn match asmCond		"\.else"
syn match asmCond		"\.endif"
syn match asmMacro		"\.macro"
syn match asmMacro		"\.endm"

syn match asmDirective		"\.[a-z][a-z]\+"


syn case match

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_asm_syntax_inits")
  if version < 508
    let did_asm_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later
  HiLink asmSection	Special
  HiLink asmLabel	Label
  HiLink asmComment	Comment
  HiLink asmDirective	Todo
  HiLink asmOpt		Statement		
  HiLink asmReg		PreProc		
  HiLink asmSeg		SpecialChar		
  HiLink asmCeg		SpecialChar		

  HiLink asmInclude	Include
  HiLink asmCond	PreCondit
  HiLink asmMacro	Macro

  HiLink hexNumber	Number
  HiLink decNumber	Number
  HiLink octNumber	Number
  HiLink binNumber	Number

  HiLink asmSpecialComment Comment
  HiLink asmIdentifier Identifier
  HiLink asmType	Type

  " My default color overrides:
  " hi asmSpecialComment ctermfg=red
  " hi asmIdentifier ctermfg=lightcyan
  " hi asmType ctermbg=black ctermfg=brown

  delcommand HiLink
endif

let b:current_syntax = "asm"

" vim: ts=8
