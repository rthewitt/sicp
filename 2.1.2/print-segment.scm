;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "print-point.scm")

(define (print-segment segment)
  (print-point (start-segment segment))
  (print-point (end-segment segment)))
