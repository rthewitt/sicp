;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define prime-sum-pair
  (list '(define (prime-sum-pair list1 list2)
           (let ((a (an-element-of list1))
                 (b (an-element-of list2)))
             (require (prime? (+ a b)))
             (list a b)))
        '(define (smallest-divisor n)
           (find-divisor n 2))
        ;; "Naïve" implementation (sans weeding out 2s).
        '(define (next-divisor divisor)
           (+ divisor 1))
        '(define (square x)
           (* x x))
        '(define (find-divisor n test-divisor)
           (cond ((> (square test-divisor) n) n)
                 ((divides? test-divisor n) test-divisor)
                 (else (find-divisor n (next-divisor test-divisor)))))
        '(define (divides? a b)
           (= (remainder b a) 0))
        '(define (prime? n)
           (= n (smallest-divisor n)))
        ))
