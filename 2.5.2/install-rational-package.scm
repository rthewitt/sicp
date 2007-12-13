;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "attach-tag.scm")
(load "make-rational.scm")
(load "tag-rational.scm")
(load "scheme-number?.scm")
(load "div.scm")
(load "equ?.scm")
(load "put-irreducible.scm")

(define (install-rational-package)
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rat n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))))
  (define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))
  (define (sub-rat x y)
    (make-rat (- (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))
  (define (mul-rat x y)
    (make-rat (* (numer x) (numer y))
              (* (denom x) (denom y))))
  (define (div-rat x y)
    (make-rat (* (numer x) (denom y))
              (* (denom x) (numer y))))
  (define (equ-rat? x y)
    (and (equ? (numer x) (numer y))
         (equ? (denom x) (denom y))))
  (define (cosine r)
    (cos (rational->real r)))
  (define (sine r)
    (sine (rational->real r)))
  (define (atangent r)
    (atan (rational->real r)))
  (define (square r)
    (mul-rat r r))
  (define (square-root r)
    (sqrt (rational->real r)))

  (define (tag x) (tag-rational x))
  (put 'add '(rational rational)
       (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational)
       (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational)
       (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational)
       (lambda (x y) (tag (div-rat x y))))
  (put 'equ? '(rational rational)
       (lambda (x y) (equ-rat? x y)))
  (put '=zero? '(rational)
       (lambda (x) (zero? (numer x))))
  (put 'numer '(rational) numer)
  (put 'denom '(rational) denom)
  (put 'cosine '(rational) cosine)
  (put 'sine '(rational) sine)
  (put 'atangent '(rational) atangent)
  (put 'square '(rational) square)
  (put 'square-root '(rational) square-root)

  (put 'make 'rational
       (lambda (n d) (tag (make-rat n d))))

  ;; Coercion
  (define (rational->real r)
    (let* ((numerator (numer r))
           (denominator (denom r)))
      (div numerator denominator)))

  ;; Scheme-number: placeholder for int
  (define (rational->scheme-number r)
    (put
     (let ((ratio (rational->real r)))
       (if (scheme-number? ratio)
           (round ratio)
           ratio))))
  (put 'project '(rational) rational->scheme-number)

  (define (scheme-number->rational n)
    (make-rational n 1))
  (put-coercion 'scheme-number 'rational scheme-number->rational)
  (put 'raise '(scheme-number)
       (lambda (n) (scheme-number->rational n)))

  'done)
