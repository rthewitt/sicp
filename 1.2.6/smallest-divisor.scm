;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (smallest-divisor n)
  (find-divisor n 2))
;; "Naive" implementation (sans weeding out 2s).
(define (next-divisor divisor)
  (+ divisor 1))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next-divisor test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))
