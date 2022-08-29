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
syn match emClose '\(\|\]\|}\)'
syn match emCloseLiteral '\(@\|\]@\|}@\)'
syn match emOpenLiteral '\(@(\}@\[\|@{\)'

syn match emSimpleExpression '@(\w\+\s)'
syn match emExpressionWithDummy '@:.*:.*:'
syn match emSignificator '@%[a-zA-Z0-9_]\+\s\+.*\n'

syn region emComment start="@#" end="\n"
syn region emExpression start="@(" end=")"
syn region emReprExpression start="@`" end="`"
syn region emStatement start="@{" end="}" transparent 
syn region emStringLiteral start='@"' end='"'


" hi def link emComment emRegion
hi def link emExpression emRegion
hi def link emReprExpression emRegion
hi def link emStatement emRegion
hi def link emStringLiteral emRegion

hi def link emName Constant
hi def link emLineNumber Constant
hi emWhiteSpace guibg=red
hi def link emEscape Constant
hi def link emAt Constant
hi def link emClose Constant
hi def link emCloseLiteral Constant
hi def link emOpenLiteral Constant

hi def link emSimpleExpression Constant
hi def link emExpressionWithDummy Constant
hi def link emSignificator Constant



hi def link emName Constant
hi def link emExpression Bold
hi def link emStatement Bold
hi def link emCloseLiteral Error
hi def link emOpenLiteral Error








hi def link emRegion Italic

hi def link emComment Comment



" EmPy highlighting
"syn include @python syntax/python.vim
function! EmPy(lang)
  if exists("b:current_syntax")
    unlet b:current_syntax
  endif
  execute "runtime! syntax/". a:lang. ".vim"
  syn keyword EmPy_Keywords False None True and as assert async await break class continue def del elif else except finally for from global if import in is lambda nonlocal not or pass raise return try while with yield end contained
  " syn keyword EmPy_Builtins ArithmeticError AssertionError AttributeError BaseException BlockingIOError BrokenPipeError BufferError BytesWarning ChildProcessError ConnectionAbortedError ConnectionError ConnectionRefusedError ConnectionResetError DeprecationWarning EOFError Ellipsis EnvironmentError Exception False FileExistsError FileNotFoundError FloatingPointError FutureWarning GeneratorExit IOError ImportError ImportWarning IndentationError IndexError InterruptedError IsADirectoryError KeyError KeyboardInterrupt LookupError MemoryError ModuleNotFoundError NameError None NotADirectoryError NotImplemented NotImplementedError OSError OverflowError PendingDeprecationWarning PermissionError ProcessLookupError RecursionError ReferenceError ResourceWarning RuntimeError RuntimeWarning StopAsyncIteration StopIteration SyntaxError SyntaxWarning SystemError SystemExit TabError TimeoutError True TypeError UnboundLocalError UnicodeDecodeError UnicodeEncodeError UnicodeError UnicodeTranslateError UnicodeWarning UserWarning ValueError Warning ZeroDivisionError  abs all any ascii bin bool breakpoint bytearray bytes callable chr classmethod compile complex copyright credits delattr dict dir divmod enumerate eval exec exit filter float format frozenset getattr globals hasattr hash help hex id input int isinstance issubclass iter len license list locals map max memoryview min next object oct open ord pow print property quit range repr reversed round set setattr slice sorted staticmethod str sum super tuple type vars zip contained
  " TODO(sloretz) why this is matching all strings after an open parenthesis?, not just ones in EmPy_Line
  syn region EmPy_String start=/\z(['"]\)/ skip="\\\\\|\\\z1" end="\z1" contained keepend
  syn cluster EmPy_Python contains=EmPy_Keywords,EmPy_Builtins,EmPy_String
  syn region EmPy_Multiline matchgroup=EmPy_Operators start="@{" end="}@" contains=@EmPy_Python
  syn region EmPy_Singleline matchgroup=EmPy_Operators start="@\[" end="]@" contains=@EmPy_Python oneline
  syn region EmPy_Inline matchgroup=EmPy_Operators start="@(" end=")" skip="(.\{-})" contains=@EmPy_Python
  syn cluster EmPy_Line contains=EmPy_Multiline,EmPy_Singleline,EmPy_Inline
  syn match EmPy_Comment "@#.*$"
  syn match EmPy_NoNewline "@$" containedin=ALLBUT,@EmPy_Line,EmPy_Comment
  hi EmPy_Operators guibg=#e9e9e9 gui=bold guifg=#965a6d
  hi EmPy_Keywords guibg=#e9e9e9 gui=bold
  hi EmPy_Builtins guibg=#e9e9e9 guifg=#00a60e
  hi EmPy_String guibg=#e9e9e9 guifg=#a6007e
  hi EmPy_Comment guibg=#e9e9e9 guifg=#0095a6
  hi EmPy_Multiline guibg=#e9e9e9
  hi EmPy_Singleline guibg=#e9e9e9
  hi EmPy_Inline guibg=#e9e9e9
  hi EmPy_NoNewline guibg=#e9e9e9 gui=bold guifg=#965a6d
endfunction


let b:current_syntax = 'jinja'



