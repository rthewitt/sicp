(define (instantiate exp environment unbound-var-handler)
;;  (write-line (environment-bindings environment))
  (define (copy exp)
    (cond ((var? exp)
           (let ((symbol (variable-symbol exp)))
             (if (environment-bound? environment symbol)
                 (let ((value (environment-lookup environment (variable-symbol exp))))
                   (copy value))
                 (unbound-var-handler exp environment))))
          ((pair? exp)
           (cons (copy (car exp)) (copy (cdr exp))))
          (else exp)))
  (copy exp))