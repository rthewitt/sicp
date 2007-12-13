;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "apply.scm")
(load "list-of-values.scm")
(load "operator.scm")
(load "operands.scm")
(load "actual-value.scm")
(load "put-print.scm")

(define (install-application-package)
  (put 'application
       (lambda (exp env)
         (apply (actual-value (operator exp) env)
                (operands exp)
                env)))
  (put-print 'application
             (lambda (procedure)
               (display (list 'compound-procedure
                              (procedure-parameters procedure)
                              (procedure-body procedure)
                              '<procedure-env>))))

  'done)
