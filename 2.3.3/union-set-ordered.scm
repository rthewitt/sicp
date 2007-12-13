;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else
         (let ((x1 (car set1))
               (x2 (car set2))
               (cdr1 (cdr set1))
               (cdr2 (cdr set2)))
           (cond ((= x1 x2)
                  (cons x1 (union-set cdr1 cdr2)))
                 ((< x1 x2)
                  (cons x1 (union-set cdr1 set2)))
                 ((< x2 x1)
                  (cons x2 (union-set set1 cdr2))))))))
