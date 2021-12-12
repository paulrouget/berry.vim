if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

setlocal indentexpr=GetBerryIndent(v:lnum)
setlocal indentkeys&
setlocal indentkeys+==end;,==for,==if,==elif,==else,==then,==while,==def

if exists("*GetBerryIndent")
	finish
endif

function! s:GetPrevNonCommentLineNum( line_num )
	let SKIP_LINES = '^\s*#'
	let nline = a:line_num
	while nline > 0
		let nline = prevnonblank(nline-1)
		if getline(nline) !~? SKIP_LINES
			break
		endif
	endwhile
	return nline
endfunction


function! GetBerryIndent( line_num )
	if a:line_num == 0
		return 0
	endif

	let this_codeline = getline( a:line_num )

	let prev_codeline_num = s:GetPrevNonCommentLineNum( a:line_num )
	let prev_codeline = getline( prev_codeline_num )
	let indnt = indent( prev_codeline_num )

	if prev_codeline =~ '^\s*\(def\|while\|else\|elif\|if\|for\|do\|class\|try\|except\)'
		if prev_codeline !~ '\(end\)$'
			if this_codeline !~ '^\s*\(end\|else\)$'
				return indnt + shiftwidth()
			else
				return indnt
			endif
		endif
	endif

	if this_codeline =~ '^\s*\(end\|else\)$'
		return indnt - shiftwidth()
	endif

	if this_codeline =~ '^\s*\(except\|elif\)'
		return indnt - shiftwidth()
	endif

	return indnt
endfunction
