;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define ev-appl-delayed-operand-loop
  '(ev-appl-delayed-operand-loop
    (save argl)
    (assign exp (op first-operand) (reg unev))
    (test (op last-operand?) (reg unev))
    (branch (label ev-appl-last-delayed-arg))
    (save env)
    (save unev)
    (assign continue (label ev-appl-accumulate-delayed-arg))
    (goto (label delay-it))))
