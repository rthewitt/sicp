;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "d1-rectangle-diagonal.scm")
(load "d2-rectangle-diagonal.scm")
(load "x-point.scm")
(load "y-point.scm")
(load "make-point.scm")
(load "distance-points.scm")

(define (length-rectangle-diagonal rectangle)
  (let* ((d1 (d1-rectangle-diagonal rectangle))
         (d2 (d2-rectangle-diagonal rectangle))
         (d1-x (x-point d1))
         (d1-y (y-point d1))
         (d2-x (x-point d2))
         (d2-y (y-point d2)))
    (distance-points d2 (make-point d1-x d2-y))))
