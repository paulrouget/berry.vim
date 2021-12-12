if exists("b:current_syntax") && b:current_syntax == "berry"
	finish
endif

" Statements
syn keyword berryConditional if else end elif
syn keyword berryRepeat for while do
syn keyword berryStatement return break continue
syn keyword berryKeyword this class nil as
syn keyword berryExceptions raise try except

syn keyword berryKeyword def nextgroup=berryFuncName skipwhite skipempty
syn match   berryFuncName
			\ "\%(r#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*"
			\ display contained

" Qualifiers
syn keyword berryQualifier static var

" Module
syn keyword berryModule import

" Boolean
syn keyword berryBoolean true false

" Operators
syn match berryOperator display "\%(+\|-\|/\|*\|=\|\^\|&\||\|!\|>\|<\|%\)=\?"

" String
syn region berryString
			\ matchgroup=berryStringDelimiter
			\ start=+"\|'+
			\ skip=+\\\\\|\\"+
			\ end=+"\|'+


" Number literals
syn match berryDecNumber
			\ display
			\ "\<[0-9][0-9_]*\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match berryHexNumber
			\ display
			\ "\<0x[a-fA-F0-9_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match berryOctNumber
			\ display
			\ "\<0o[0-7_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match berryBinNumber
			\ display
			\ "\<0b[01_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="

syn match berryFloat
			\ display
			\ "\<[0-9][0-9_]*\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\|\.\)\@!"
syn match berryFloat
			\ display
			\ "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)\="
syn match berryFloat
			\ display
			\ "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\(f32\|f64\)\="
syn match berryFloat
			\ display
			\ "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)"

" Built-in Functions
syn keyword berryBuiltinFunction print

" Comments
syn keyword berryTodo contained TODO FIXME XXX
syn match berryCommentLine '#.*$' contains=berryTodo,@Spell

hi def link berryDecNumber             berryNumber
hi def link berryHexNumber             berryNumber
hi def link berryOctNumber             berryNumber
hi def link berryBinNumber             berryNumber
hi def link berryNumber                Number
hi def link berryFloat                 Float
hi def link berryConditional           Conditional
hi def link berryQualifier             Type
hi def link berryRepeat                Repeat
hi def link berryStatement             Statement
hi def link berryTodo                  Todo
hi def link berryExceptions            Exception
hi def link berryEscapeError           Error
hi def link berryString                String
hi def link berryStringDelimiter       String
hi def link berryOperator              Operator
hi def link berryModule                Include
hi def link berryBuiltinFunction       Function
hi def link berryOperator              Operator
hi def link berryBoolean               Boolean
hi def link berryKeyword               Keyword
hi def link berryFuncName              Function
hi def link berryCommentLine           Comment
hi def link berryCommentBlockNest      Comment

if !exists("b:current_syntax")
	let b:current_syntax = "berry"
endif
