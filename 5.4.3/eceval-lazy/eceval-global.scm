(define (eceval-global exp)
  (set-register-contents! eceval 'exp exp)
  (set-register-contents! eceval 'env (get-global-environment))
  (start eceval)
  (get-register-contents eceval 'val))