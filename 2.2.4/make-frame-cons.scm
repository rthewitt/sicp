;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (make-frame-cons origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
