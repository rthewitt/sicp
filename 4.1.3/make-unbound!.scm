;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "first-frame.scm")
(load "find-binding.scm")
(load "unbound-binding?.scm")
(load "binding-frame.scm")
(load "unbind-variable!.scm")

(define (make-unbound! var env)
  (let* ((binding (find-binding var env))
         (frame (binding-frame binding)))
    (if (unbound-binding? binding)
        (error "Unbound variable -- MAKE-UNBOUND!" var)
        (unbind-variable! var frame))))
