;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define amb-qeval-make-data-base
  '(define (amb-qeval-make-data-base initia)
     (let ((assertions '()))
       (define (put-assertion! assertion)
         (if (null? assertions)
             (set! assertions (list assertion))
             (append! assertions (list assertion)))
         'ok)
       (define (dispatch m)
         (cond ((eq? m 'put-assertion!) put-assertion!)
               ((eq? m 'get-assertions) assertions)
               (else (error "Unknown request -- MAKE-DATA-BASE" m))))
       (if (not (null? initia))
           (amb-qeval-map put-assertion! initia))
       dispatch)))
