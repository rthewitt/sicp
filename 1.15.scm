#!/usr/bin/env chicken-scheme
(use test)

(define count (make-parameter 0))
(define (count++) (count (+ (count) 1)))

(define (cube x) (* x x x))

(define (p x) (count++) 
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(parameterize ((count 0))
  (sine 12.15)
  (test 5 (count)))
