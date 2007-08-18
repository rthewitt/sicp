(define factorial-machine
  (make-machine
   '(product counter n t u)
   `((> ,>) (* ,*) (+ ,+))
   '(factorial
     (assign product (const 1))
     (assign counter (const 1))
     (goto (label test-counter-n))
     test-counter-n
     (test (op >) (reg counter) (reg n))
     (branch (label factorial-done))
     (assign t (op *) (reg counter) (reg product))
     (assign product (reg t))
     (assign u (op +) (reg counter) (const 1))
     (assign counter (reg u))
     (goto (label test-counter-n))
     factorial-done)))
