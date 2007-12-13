;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "tolerant=.scm")
(load "pi-stream.scm")
(load "pi.scm")

(define pi-estimate (stream-ref pi-stream 50000))

(test
 "monte-carlo pi by unit circle to 0.1"
 pi-estimate
 pi
 '(tolerant= pi pi-estimate 0.1)
 (lambda (x y) (tolerant= x y 0.1)))
