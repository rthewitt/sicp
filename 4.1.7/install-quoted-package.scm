(load "put.scm")
(load "text-of-quotation.scm")

(define (install-quoted-package)
  (define (analyze-quoted exp)
    (let ((qval (text-of-quotation exp)))
      (lambda (env) qval)))
  (put 'quote analyze-quoted)
  'done)