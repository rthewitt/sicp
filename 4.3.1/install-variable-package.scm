(load "put.scm")
(load "lookup-variable-value.scm")

(define (install-variable-package)
  (define (analyze-variable exp)
    (lambda (env succeed fail)
      (succeed (lookup-variable-value exp env)
               fail)))
  (put 'variable analyze-variable)
  'done)
