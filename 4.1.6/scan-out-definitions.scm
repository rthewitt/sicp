;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "definition?.scm")
(load "definition-value.scm")
(load "definition-variable.scm")
(load "make-unassignment.scm")
(load "make-let.scm")

(define (scan-out-definitions body)
  (define (definitions expressions)
    (keep-matching-items expressions definition?))
  (define (values expressions)
    (delete-matching-items expressions definition?))
  (define (assignments definitions)
    (map (lambda (definition) (make-assignment
                               (definition-variable definition)
                               (definition-value definition))) definitions))
  (define (unassignments definitions)
    (map (lambda (definition) (make-unassignment
                               (definition-variable definition))) definitions))
  (let* ((definitions (definitions body))
         (values (values body)))
    (if (null? definitions)
        values
        (list (make-let (unassignments definitions)
                        (append (assignments definitions)
                                values))))))
