(load "the-empty-environment.scm")
(load "enclosing-environment.scm")
(load "empty-environment?.scm")
(load "first-frame.scm")
(load "make-binding.scm")

;; Returns a cons of value and frame
(define (find-binding variable env)
  (if (empty-environment? env)
      (make-binding variable #!default the-empty-environment)
        (let* ((frame (first-frame env))
               (value (hash-table/get frame variable #!default)))
          (if (default-object? value)
              (find-binding-env variable (enclosing-environment frame))
              (make-binding variable value frame)))))
