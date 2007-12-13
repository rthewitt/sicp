;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "analyze.scm")
(load "primitive-procedure?.scm")
(load "apply-primitive-procedure.scm")
(load "compound-procedure?.scm")
(load "procedure-body.scm")
(load "procedure-parameters.scm")
(load "procedure-environment.scm")
(load "extend-environment.scm")
(load "operands.scm")
(load "operator.scm")

(define (install-application-package)
  (define (analyze-application exp)
    (let ((fproc (analyze (operator exp)))
          (aprocs (map analyze (operands exp))))
      (lambda (env)
        (execute-application (fproc env)
                             (map (lambda (aproc) (aproc env))
                                  aprocs)))))
  (define (execute-application proc args)
    (cond ((primitive-procedure? proc)
           (apply-primitive-procedure proc args))
          ((compound-procedure? proc)
           ((procedure-body proc)
            (extend-environment (procedure-parameters proc)
                                args
                                (procedure-environment proc))))
          (else
           (error
            "Unknown procedure type -- EXECUTE-APPLICATION"
            proc))))
  (put 'application analyze-application)
  'done)
