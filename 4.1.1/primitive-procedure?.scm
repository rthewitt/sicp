;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "tagged-list?.scm")

(define (primitive-procedure? proc)
  (tagged-list? proc 'primitive))
