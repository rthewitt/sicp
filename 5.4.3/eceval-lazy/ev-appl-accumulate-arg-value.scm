(define ev-appl-accumulate-arg-value
  '(ev-appl-accumulate-arg-value
    (restore unev)
    (restore env)
    (restore argl)
    (assign argl (op adjoin-arg) (reg val) (reg argl))
    (assign unev (op rest-operands) (reg unev))
    (goto (label ev-appl-operand-value-loop))))