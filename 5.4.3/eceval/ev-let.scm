;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define ev-let
  '(ev-let
    (assign exp (op let->combination) (reg exp))
    (goto (label eval-dispatch))))
