;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define ev-or
  '(ev-or
    (assign exp (op or->if) (reg exp))
    (goto (label eval-dispatch))))
