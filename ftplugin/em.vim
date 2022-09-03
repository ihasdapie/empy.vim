" Author: Alejandro "HiPhish" Sanchez
" License: The MIT License {{{
"   Copyright (c) 2016 Alejandro "HiPhish" Sanchez
"   Copyright (c) 2022 Brian Chen
"   
"   Permission is hereby granted, free of charge, to any person obtaining
"   a copy of this software and associated documentation files (the "Software"),
"   to deal in the Software without restriction, including without limitation
"   the rights to use, copy, modify, merge, publish, distribute, sublicense,
"   and/or sell copies of the Software, and to permit persons to whom the
"   Software is furnished to do so, subject to the following conditions:
"   
"   The above copyright notice and this permission notice shall be included
"   in all copies or substantial portions of the Software.
"   
"   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
"   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
"   OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
"   DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"   TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
"   OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}


" Try to detect empy code inside a buffer file, the function returns true if
" empy has been detected, false otherwise.
"
" parameter first:  First line to check for the presence of Jija code.
" parameter last:   Last line to check for the presence of Jija code.
"
" The parameters will get adjusted to account for files which are too small.
" This is because the function might get called by scripts that just assume a
" certain minimal length.
function! em#DetectEmpy(first, last) abort
	" How many lines to count, range takes precedence over default values
	let l:first = min([a:first, line('$')])
	let l:last  = min([a:last, line('$')])
	let l:empy_pattern = '\v'.
				\ '\@\{.*\}|'.
				\ '\@\(.*\)|'.
				\ '\@?\S\+\n|'.
				\ '\@#.*\n'.
				\ '\@".*"'
	" Probe a number of lines for empy code, give up if none is found.
	for l:line in range(l:first, l:last)
		if getline(l:line) =~? l:empy_pattern
			return l:line
		endif
	endfor
endfun


" Appends '.empy' to the 'filetype' option if empy code has been detected in
" the buffer.
function! em#AdjustFiletype() abort
	if &filetype =~? 'empy'
		return
	endif
	if em#DetectEmpy(1,100)
		execute 'set filetype+=.em'
	endif
endfun
