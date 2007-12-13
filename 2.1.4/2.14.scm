;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-center-percent-interval.scm")
(load "print-center-percent-interval.scm")
(load "center-interval.scm")
(load "percent-interval.scm")
(load "par1-interval.scm")
(load "par2-interval.scm")

(define i (make-center-percent-interval 5 .05))
(define j (make-center-percent-interval 3 .05))
(define x (par1-interval i j))
(define y (par2-interval i j))
(print-center-percent-interval x)
(print-center-percent-interval y)
