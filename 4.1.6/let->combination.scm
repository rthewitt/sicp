;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "let-binding-variable.scm")
(load "let-bindings.scm")
(load "let-binding-value.scm")
(load "let-body.scm")
(load "named-let-bindings.scm")
(load "named-let-binding-value.scm")
(load "named-let-binding-variable.scm")
(load "named-let-body.scm")
(load "named-let-procedure.scm")
(load "named-let?.scm")
(load "sequence->exp.scm")
(load "make-lambda.scm")
(load "make-procedure-definition.scm")

(define (let->combination exp)
  (if (named-let? exp)
      (let* ((procedure (named-let-procedure exp))
             (bindings (named-let-bindings exp))
             (variables (map named-let-binding-variable bindings))
             (values (map named-let-binding-value bindings))
             (body (named-let-body exp)))
        (sequence->exp (list (make-procedure-definition procedure variables body)
                             (cons procedure values))))
      (let* ((bindings (let-bindings exp))
             (variables (map let-binding-variable bindings))
             (values (map let-binding-value bindings))
             (body (let-body exp)))
        (cons (make-lambda variables body) values))))
