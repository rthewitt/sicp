;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define amb-qeval-tagged-list?
  '(define (amb-qeval-tagged-list? exp tag)
     (if (pair? exp)
         (eq? (car exp) tag)
         false)))
