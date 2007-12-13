;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (exp b n)
  (define (iter a b n)
    (display (string-append "iter " (number->string a) " " (number->string b) " " (number->string n)))
    (newline)
    (cond ((= n 0) a)
          ((even? n) (iter a (square b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
    (iter 1 b n)
  )

(exp 2 1000)
