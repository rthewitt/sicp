#!/usr/bin/env chicken-scheme

(define (install-negation-package)
  (put 'negate '(scheme-number)
       (lambda (n) (make-scheme-number (- n))))
  (put 'negate '(rational)
       (lambda (r) (make-rational (- (numer r))
                             (denom r))))
  (put 'negate '(complex)
       (lambda (z) (make-complex-from-real-imag
               (- (real-part z))
               (- (imag-part z)))))

  (define (variable p) (car p))
  (define (term-list p) (cdr p))
  (define (make-term order coeff) (list order coeff))
  (define (term-list p) (cdr p))
  (define (order term) (car term))
  (define (coeff term) (cadr term))
  (put 'negate '(polynomial)
       (lambda (p) (make-polynomial (variable p)
                               (map (lambda (term)
                                      (make-term (order term)
                                                 (negate (coeff term))))
                                    (term-list p))))))

(define (negate n) (apply-generic 'negate n))

(define (install-polynomial-sub-package)
  (define (sub-poly p1 p2)
    (add (attach-tag 'polynomial p1)
         (negate (attach-tag 'polynomial p2))))
  (put 'sub '(polynomial polynomial) sub-poly))
