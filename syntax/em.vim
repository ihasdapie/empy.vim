" syntax file for .em files

syntax case match
if (exists('b:current_syntax')) && (b:current_syntax =~? 'em')
  finish
endif


syn match emName '@?\S\+\n'
syn match emLineNumber '@!{\d+:\d+}\n'
syn match emWhiteSpace '@\s'
syn match emEscape '\(@\\0\|@\\a\|@\\b\|@\\d\|@\\e\|@\\f\|@\\h\|@\\oOOO\|@\\qQQQQ\|@\\r\|@\\s\|@\\t\|@\\v\|@\\xHH\|@\\z\|@\\^X\)'
syn match emAt '@@'
syn match emSignificator '@%[a-zA-Z0-9_]\+\s\+.*\n'

" syn region emStringLiteral start='@"' end='"'
" syn match emSimpleExpression '@(\w\+\s)'

hi def link emName emSimple
hi def link emLineNumber emSimple
hi def link emWhiteSpace emSimple
hi def link emEscape emSimple
hi def link emAt emSimple
hi def link emSignificator emSimple
hi def link emSimple Constant
hi def link emSimple Bold




syn keyword emKeywords False None True and as assert async await break class continue def del elif else except finally for from global if import in is lambda nonlocal not or pass raise return try while with yield end contained
syn keyword emBuiltins ArithmeticError AssertionError AttributeError BaseException BlockingIOError BrokenPipeError BufferError BytesWarning ChildProcessError ConnectionAbortedError ConnectionError ConnectionRefusedError ConnectionResetError DeprecationWarning EOFError Ellipsis EnvironmentError Exception False FileExistsError FileNotFoundError FloatingPointError FutureWarning GeneratorExit IOError ImportError ImportWarning IndentationError IndexError InterruptedError IsADirectoryError KeyError KeyboardInterrupt LookupError MemoryError ModuleNotFoundError NameError None NotADirectoryError NotImplemented NotImplementedError OSError OverflowError PendingDeprecationWarning PermissionError ProcessLookupError RecursionError ReferenceError ResourceWarning RuntimeError RuntimeWarning StopAsyncIteration StopIteration SyntaxError SyntaxWarning SystemError SystemExit TabError TimeoutError True TypeError UnboundLocalError UnicodeDecodeError UnicodeEncodeError UnicodeError UnicodeTranslateError UnicodeWarning UserWarning ValueError Warning ZeroDivisionError  abs all any ascii bin bool breakpoint bytearray bytes callable chr classmethod compile complex copyright credits delattr dict dir divmod enumerate eval exec exit filter float format frozenset getattr globals hasattr hash help hex id input int isinstance issubclass iter len license list locals map max memoryview min next object oct open ord pow print property quit range repr reversed round set setattr slice sorted staticmethod str sum super tuple type vars zip contained
" syn match emOperators '\+\-\%\*\/\.'

" TODO(sloretz) why this is matching all strings after an open parenthesis?, not just ones in emLine
syn region emString start=/\z(['"]\)/ skip="\\\\\|\\\z1" end="\z1" contained keepend

syn cluster emPython contains=emKeywords,emBuiltins,emString
syn region emMultiline matchgroup=emOperators start="@{" end="}@" contains=@emPython
" syn region emSingleline1 matchgroup=emOperators start="@{" end="}" contains=@emPython
syn region emSingleline2 matchgroup=emOperators start="@\[" end="]@" contains=@emPython oneline
syn region emInline matchgroup=emOperators start="@(" end=")" skip="(.\{-})" contains=@emPython
syn region emRepr matchgroup=emOperators start="@`" end="`" contains=@emPython
syn region emExpressionWithDummy matchgroup=emOperators start="@:." end="`" contains=@emPython
syn match emExpressionWithDummy '@:.*:.*:' 

syn cluster emLine contains=emMultiline,emSingleline1,emSingleline2,emInline
syn match emComment "@#.*$"
syn match emNoNewline "@$" containedin=ALLBUT,@emLine,emComment


hi def link emOperators Bold
hi def link emKeywords Bold
hi def link emBuiltins Bold

hi def link emString String
hi def link emComment Comment
hi def link emMultiline PreProc
hi def link emSingleline1 PreProc
hi def link emSingleline2 Special
hi def link emInline Special
hi def link emNoNewline Special


let b:current_syntax = 'em'
