#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.79][2\.79:1]]

(use sicp)

(define (scheme-number->rational scheme-number)
  (let ((number (contents scheme-number)))
    (make-rational (numerator number)
                   (denominator number))))

(define (rational->complex rational)
  (make-complex-from-real-imag
   (/ (numer rational) (denom rational))
   0))

(define (tag-scheme-number scheme-number)
  (attach-tag 'scheme-number scheme-number))

(define (tag-rational rational)
  (attach-tag 'rational rational))

(define (tag-complex complex)
  (attach-tag 'complex complex))

;; Let's modify the rational package so that it exports numer and
;; denom.
(define (install-rational-package)
  ;; internal procedures
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
  ;; interface to rest of the system
  (define tag tag-rational)
  (put 'add '(rational rational)
       (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational)
       (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational)
       (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational)
       (lambda (x y) (tag (div-rat x y))))
  (put 'make 'rational
       (lambda (n d) (tag (make-rat n d))))
  (put 'numer '(rational) numer)
  (put 'denom '(rational) denom)
  'done)

(define (numer rational)
  (apply-generic 'numer rational))

(define (denom rational)
  (apply-generic 'denom rational))

(define (scheme-number-rational-equ? scheme-number rational)
  (let ((scheme-number-rational (scheme-number->rational scheme-number)))
    (and (= (numer scheme-number-rational) (numer rational))
         (= (denom scheme-number-rational) (denom rational)))))

(define (rational-complex-equ? rational complex)
  (let ((rational-complex (rational->complex rational)))
    (and (= (magnitude rational-complex) (magnitude complex))
         (= (angle rational-complex) (angle complex)))))

(define (install-equality-package)
  (install-scheme-number-package)
  (install-rational-package)
  (install-complex-package)
  (put 'equ? '(scheme-number scheme-number)
       (lambda (x y) (= x y)))
  (put 'equ? '(scheme-number rational)
       (lambda (x y)
         (let ((scheme-number (tag-scheme-number x))
               (rational (tag-rational y)))
           (scheme-number-rational-equ? scheme-number rational))))
  (put 'equ? '(scheme-number complex)
       (lambda (x y)
         (let ((scheme-number (tag-scheme-number x))
               (complex (tag-complex y)))
           (rational-complex-equ?
            (scheme-number->rational scheme-number)
            complex))))

  (put 'equ? '(rational scheme-number)
       (lambda (x y)
         (let ((rational (tag-rational x))
               (scheme-number (tag-rational y)))
           (scheme-number-rational-equ? scheme-number rational))))
  (put 'equ? '(rational rational)
       (lambda (x y)
         (let ((rational-x (tag-rational x))
               (rational-y (tag-rational y)))
           (and (= (numer rational-x)
                   (numer rational-y))
                (= (denom rational-x)
                   (denom rational-y))))))
  (put 'equ? '(rational complex)
       (lambda (x y)
         (let ((rational (attach-tag 'rational x))
               (complex (attach-tag 'complex y)))
           (rational-complex-equ? rational complex))))

  (put 'equ? '(complex scheme-number)
       (lambda (x y)
         (let ((complex (tag-complex x))
               (scheme-number (tag-complex y)))
           (rational-complex-equ?
            (scheme-number->rational scheme-number)
            complex))))
  (put 'equ? '(complex rational)
       (lambda (x y)
         (let ((complex (tag-complex x))
               (rational (tag-rational y)))
           (rational-complex-equ? rational complex))))
  (put 'equ? '(complex complex)
       (lambda (x y)
         (let ((complex-x (tag-complex x))
               (complex-y (tag-complex y)))
           (and (= (magnitude complex-x)
                   (magnitude complex-y))
                (= (angle complex-y)
                   (angle complex-y)))))))

(define (equ? x y)
  (apply-generic 'equ? x y))

;; 2\.79:1 ends here
