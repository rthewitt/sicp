;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define eval-dispatch
  '(eval-dispatch
    (test (op self-evaluating?) (reg exp))
    (branch (label ev-self-eval))
    (test (op variable?) (reg exp))
    (branch (label ev-variable))
    (test (op quoted?) (reg exp))
    (branch (label ev-quoted))
    (test (op assignment?) (reg exp))
    (branch (label ev-assignment))
    (test (op definition?) (reg exp))
    (branch (label ev-definition))
    (test (op if?) (reg exp))
    (branch (label ev-if))
    (test (op lambda?) (reg exp))
    (branch (label ev-lambda))
    (test (op begin?) (reg exp))
    (branch (label ev-begin))
    (test (op and?) (reg exp))
    (branch (label ev-and))
    (test (op or?) (reg exp))
    (branch (label ev-or))
    (test (op let?) (reg exp))
    (branch (label ev-let))
    (test (op let*?) (reg exp))
    (branch (label ev-let*))
    (test (op cond?) (reg exp))
    (branch (label ev-cond))
    (test (op application?) (reg exp))
    (branch (label ev-application))
    (goto (label unknown-expression-type))))
