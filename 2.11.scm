#!/usr/bin/env chicken-scheme

(use test)

(include "interval.scm")

(define (positive-interval? x)
  (and (positive? (lower-bound x))
       (positive? (upper-bound x))))

(define (negative-interval? x)
  (and (negative? (lower-bound x))
       (negative? (upper-bound x))))

(define (mixed-interval? x)
  (xor (positive? (lower-bound x))
       (positive? (upper-bound x))))

(define (mul-interval-cases x y)
  (let ((x-negative? (negative-interval? x))
        (y-negative? (negative-interval? y))
        (x-positive? (positive-interval? x))
        (y-positive? (positive-interval? y))
        (x-mixed? (mixed-interval? x))
        (y-mixed? (mixed-interval? y))
        (x-lower (lower-bound x))
        (x-upper (upper-bound x))
        (y-lower (lower-bound y))
        (y-upper (upper-bound y)))
    (cond ((and x-negative? y-negative?)
           (make-interval (* x-upper y-upper)
                          (* x-lower y-lower)))
          ((and x-negative? y-positive?)
           (make-interval (* x-lower y-upper)
                          (* x-upper y-lower)))
          ((and x-negative? y-mixed?)
           (make-interval (* x-lower y-upper)
                          (* x-lower y-lower)))
          ((and x-positive? y-negative?)
           (make-interval (* x-upper y-lower)
                          (* x-lower y-upper)))
          ((and x-positive? y-positive?)
           (make-interval (* x-lower y-lower)
                          (* x-upper y-upper)))
          ((and x-positive? y-mixed?)
           (make-interval (* x-upper y-lower)
                          (* x-upper y-upper)))
          ((and x-mixed? y-negative?)
           (make-interval (* x-upper y-lower)
                          (* x-lower y-lower)))
          ((and x-mixed? y-positive?)
           (make-interval (* x-lower y-upper)
                          (* x-upper y-upper)))
          ((and x-mixed? y-mixed?)
           (make-interval (min (* x-lower y-upper)
                               (* x-upper y-lower))
                          (max (* x-upper y-upper)
                               (* x-lower y-lower)))))))

(let ((negative (make-interval -5 -3))
      (mixed (make-interval -1 7))
      (positive (make-interval 11 13)))
  (test (mul-interval negative negative)
        (mul-interval-cases negative negative))
  (test (mul-interval negative positive)
        (mul-interval-cases negative positive))
  (test (mul-interval negative mixed)
        (mul-interval-cases negative mixed))
  (test (mul-interval positive negative)
        (mul-interval-cases positive negative))
  (test (mul-interval positive positive)
        (mul-interval-cases positive positive))
  (test (mul-interval positive mixed)
        (mul-interval-cases positive mixed))
  (test (mul-interval negative negative)
        (mul-interval-cases negative negative))
  (test (mul-interval mixed positive)
        (mul-interval-cases mixed positive))
  (test (mul-interval mixed mixed)
        (mul-interval-cases mixed mixed)))
