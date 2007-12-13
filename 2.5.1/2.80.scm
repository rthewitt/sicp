;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "install-scheme-number-package.scm")
(load "install-complex-package.scm")
(load "install-rational-package.scm")
(load "=zero?.scm")
(load "make-complex-from-mag-ang.scm")
(load "make-complex-from-real-imag.scm")
(load "make-rational.scm")
(load "make-scheme-number.scm")

(install-scheme-number-package)
(install-complex-package)
(install-rational-package)

(define polar1 (make-complex-from-mag-ang 0 45))
(define polar2 (make-complex-from-mag-ang 1 45))
(define rectangular1 (make-complex-from-real-imag 0 0))
(define rectangular2 (make-complex-from-real-imag 1 1))
(define rational1 (make-rational 0 2))
(define rational2 (make-rational 1 2))
(define scheme1 (make-scheme-number 0))
(define scheme2 (make-scheme-number 1))

(=zero? polar1)
(=zero? polar2)
(=zero? rectangular1)
(=zero? rectangular2)
(=zero? rational1)
(=zero? rational2)
(=zero? scheme1)
(=zero? scheme2)
