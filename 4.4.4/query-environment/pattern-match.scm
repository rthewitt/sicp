(define (pattern-match pat dat environment)
  (cond ((eq? environment 'failed) 'failed)
        ((equal? pat dat) environment)
        ((var? pat) (extend-if-consistent pat dat environment))
        ((and (pair? pat) (pair? dat))
         (pattern-match (cdr pat)
                        (cdr dat)
                        (pattern-match (car pat)
                                       (car dat)
                                       environment)))
        (else 'failed)))