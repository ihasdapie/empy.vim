
@# emComment

@# emName
@?emName

@# emLineNumber
@!100
@!12345

@#emWhitespace
@ 

@# emEscape
@\0
@\d

@# emAt
@@

@# emStringLiteral
@"string"

@# emExpression
@(this is an expression)

@# emSimpleExpression
@simple_expression
(
  @event_type
)

@# emReprExpression
@`repr_expression`

@# emExpressionWithDummy
@:2 + 2:this will get replaced with 4:

@# emStatement
@{", ".join([i for i in range(100)])}@
@{", ".join([i for i in range(100)])}

@# emSignificator
@%keywords  'physics', 'gravity', 'Einstein', 'relativity'




