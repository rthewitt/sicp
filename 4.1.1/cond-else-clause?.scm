;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "cond-predicate.scm")

(define (cond-else-clause? clause)
  (eq? (cond-predicate clause) 'else))
