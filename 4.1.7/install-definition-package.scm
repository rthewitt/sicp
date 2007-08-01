(load "put.scm")

(define (install-definition-package)
  (define (analyze-definition exp)
    (let ((var (definition-variable exp))
          (vproc (analyze (definition-value exp))))
      (lambda (env)
        (define-variable! var (vproc env) env)
        'ok)))
  (put 'define analyze-definition)
  'done)
