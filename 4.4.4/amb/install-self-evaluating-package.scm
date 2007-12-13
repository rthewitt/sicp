;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-self-evaluating-package)
  (define (analyze-self-evaluating exp)
    (lambda (env succeed fail)
      (succeed exp fail)))
  (put-amb 'self-evaluating analyze-self-evaluating)
  'done)

