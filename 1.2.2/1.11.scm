;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

(define (f n)
  (define (iter x y z count)
    (display (string-append (number->string x) " " (number->string y) " " (number->string z)))
    (newline)
    (cond ((= count 0) x)
          ((= count 1) y)
          ((= count 2) z)
 (else (iter y z (+ (* 3 x) (* 2 y) z) (- count 1)))))
  (iter 0 1 2 n)
  )


(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
