;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "smallest-divisor.scm")
(load "prime.scm")

(define (timed-prime-test n prime-test)
  (with-timings (lambda()
                  (display n)
                  (prime-test n))
                (lambda(run-time gt-time real-time)
                  (display (string-append " " (number->string run-time) " " (number->string gt-time) " " (number->string real-time)))
                  (newline))))

(define (search-for-primes-test n prime-test)
  (define (test n count)
    (cond ((= count 3) #t)
          ((even? n)
           (test (+ n 1) count))
          ((prime? n)
           (timed-prime-test n prime-test)
           (if (< count 3)
               (test (+ n 2) (+ count 1))
               n))
          (else (test (+ n 2) count))))
  (test n 0))

(define (search-for-primes n)
  (search-for-primes-test n prime?))
