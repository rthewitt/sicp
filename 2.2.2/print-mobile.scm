;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "left-branch.scm")
(load "right-branch.scm")
(load "branch-length.scm")
(load "branch-structure.scm")
(load "branch-mobile.scm")

(define (print-branch branch)
  (let ((length (branch-length branch))
        (structure (branch-structure branch)))
    (display length)
    (display ": ")
    (if (branch-mobile? structure)
        (print-mobile structure)
        (display structure))))

(define (print-mobile mobile)
  (display "[")
  (print-branch (left-branch mobile))
  (display ", ")
  (print-branch (right-branch mobile))
  (display "]")
  )
