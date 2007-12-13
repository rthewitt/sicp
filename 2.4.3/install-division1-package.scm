;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")

(define (install-division1-package)
  (define this-division 'division1)
  (define (record port)
    (read port))
  (define (name record)
    (car record))
  (define (employee-record record)
    (cadr record))
  (define (salary record)
    (cadr (assq 'salary record)))
  (put 'record this-division record)
  (put 'name this-division name)
  (put 'employee-record this-division employee-record)
  (put 'salary this-division salary)
  'done)
