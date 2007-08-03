(define (fast-* n b)
  (define (double a)
    (* 2 a))
  (define (halve a)
    (/ 2 a))
  (cond ((= n 1) b)
        ((even? n) (double (fast-* (halve n) b)))
        (else (+ b (fast-* (- n 1) b)))))

(fast-* 3 11)