(load "put.scm")
(load "analyze.scm")
(load "if-predicate.scm")
(load "if-consequent.scm")
(load "if-alternative.scm")
(load "true?.scm")

(define (install-if-fail-package)
  (define (analyze-if-fail exp)
    (let ((pproc (analyze (if-predicate exp)))
          (cproc (analyze (if-consequent exp))))
      (lambda (env succeed fail)
        (pproc env
               (lambda (pred-value fail2)
                 (pproc env succeed fail2))
               (lambda ()
                 (cproc env succeed fail))))))
  (put 'if-fail analyze-if-fail)
  'done)
