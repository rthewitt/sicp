;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (amb-qeval-list->string list)
  (with-output-to-string
    (lambda ()
      (write list))))

