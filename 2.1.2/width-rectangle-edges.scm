;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "length-segment.scm")

(define (width-rectangle-edges rectangle)
  (length-segment (car rectangle)))
