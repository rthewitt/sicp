(define env1 (make-root-top-level-environment))
(define env2 (extend-top-level-environment env1))
(environment-define env1 'x 2)
(environment-lookup env2 'x)
(environment-define env2 'x 3)
(environment-lookup env1 'x)
(environment-lookup env2 'x)
