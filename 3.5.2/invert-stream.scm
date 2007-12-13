;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "stream-map.scm")

(define (invert-stream s)
  (stream-map (lambda (x) (/ 1 x)) s))
