;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(define test-and (eval-global '(and true true (and false 1))))
(define test-or (eval-global '(or false false (or false true))))

(test
 "and with n args and sub-ands"
 #f
 test-and
 'eq?
 eq?)

(test
 "or with n args and sub-ors"
 #t
 test-or
 'eq?
 eq?)
