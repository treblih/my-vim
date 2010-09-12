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

syn match asmReg	'%cs' 
syn match asmReg	'%ds' 
syn match asmReg	'%es' 
syn match asmReg	'%gs' 
syn match asmReg	'%fs' 
syn match asmReg	'%gs' 
syn match asmReg	'%ss'
syn match asmReg	'%cr0' 
syn match asmReg	'%cr1' 
syn match asmReg	'%cr2' 
syn match asmReg	'%cr3'
syn match asmReg	'%cr4'

syn match asmReg	'%al'
syn match asmReg	'%ah' 
syn match asmReg	'%ax' 
syn match asmReg	'%eax' 
syn match asmReg	'%bl'
syn match asmReg	'%bh' 
syn match asmReg	'%bx' 
syn match asmReg	'%ebx' 
syn match asmReg	'%cl' 
syn match asmReg	'%ch' 
syn match asmReg	'%cx' 
syn match asmReg	'%ecx'
syn match asmReg	'%dl' 
syn match asmReg	'%dh' 
syn match asmReg	'%dx' 
syn match asmReg	'%edx'
syn match asmReg	'%si' 
syn match asmReg	'%esi' 
syn match asmReg	'%di' 
syn match asmReg	'%edi'
syn match asmReg	'%bp' 
syn match asmReg	'%ebp' 
syn match asmReg	'%sp' 
syn match asmReg	'%esp'

syn keyword asmOpt	mov movb movw movl
syn keyword asmOpt	add addb addw addl
syn keyword asmOpt	sub subb subw subl
syn keyword asmOpt	mul mulb mulw mull
syn keyword asmOpt	div divb divw divl
syn keyword asmOpt	inc incb incw incl
syn keyword asmOpt	dec decb decw decl
" syn keyword asmOpt	 

syn keyword asmOpt	sal salb salw sall
syn keyword asmOpt	sar sarb sarw sarl
syn keyword asmOpt	shl shlb shlw shll
syn keyword asmOpt	shr shrb shrw shrl

syn keyword asmOpt	rep repe repne repz repnz

syn keyword asmOpt	lods lodsb lodsw lodsl
syn keyword asmOpt	stos stosb stosw stosl
syn keyword asmOpt	movs movsb movsw movsl
syn keyword asmOpt	cmps cmpsb cmpsw cmpsl

syn keyword asmOpt	cmp loop hlt
syn keyword asmOpt	and andb andw andl
syn keyword asmOpt	 or  orb  orw  orl
syn keyword asmOpt	xor xorb xorw xorl
syn keyword asmOpt	not
syn keyword asmOpt	 in  inb  inw  inl
syn keyword asmOpt	out outb outw outl
" syn keyword asmOpt	 
" syn keyword asmOpt	 
syn keyword asmOpt	push pushb pushw pushl pusha puahad
syn keyword asmOpt	 pop  popb  popw  popl  popa  popad 

syn keyword asmOpt	call lcall jmp ljmp ljmpl int
syn keyword asmOpt	jc jnc je jne jl jle jg jge js jns
syn keyword asmOpt	jz jnz
syn keyword asmOpt	div divb divw divl
syn keyword asmOpt	lgdt lldt lidt ltr
syn keyword asmOpt	sgdt sldt sidt str
syn keyword asmOpt	ret iret lret leave
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
syn match asmType "\.2byte"
syn match asmType "\.4byte"
syn match asmType "\.8byte"
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

" syn match asmDirective		"\.[a-z][a-z]\+"

syn match String	'".*"'

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
