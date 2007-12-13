;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (unify-match p1 p2 environment)
  (cond ((eq? environment 'failed) 'failed)
        ((equal? p1 p2) environment)
        ((var? p1) (extend-if-possible p1 p2 environment))
        ((var? p2) (extend-if-possible p2 p1 environment))
        ((and (pair? p1) (pair? p2))
         (unify-match (cdr p1)
                      (cdr p2)
                      (unify-match (car p1)
                                   (car p2)
                                   environment)))
        (else 'failed)))
