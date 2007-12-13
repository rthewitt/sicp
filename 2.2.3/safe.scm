;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (safe? k positions)
  (define (collision? collidendum k collidentia)
    (if (null? collidentia)
        #f
        (let ((collidens (car collidentia))
              (n-collidentia (length collidentia)))
          (cond ((= collidendum collidens) #t)
                ((= (- k n-collidentia) (abs (- collidendum collidens))) #t)
                (else (collision? collidendum k (cdr collidentia)))))))
  (not (collision? (car positions) k (cdr positions))))
