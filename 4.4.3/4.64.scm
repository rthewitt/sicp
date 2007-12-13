;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "context.scm")
(load "microshaft-data-base-sans-outranked-by.scm")

(initialize-data-base microshaft-data-base)

;; We seem to be dealing with applicative order here.

;; Having swapped the clauses of the last conjunction, the interpreter
;; doesn't know that middle-managers mediated between staff and
;; bosses; it therefore reapplies outranked-by one level deep, ad
;; infinitum.

(query
 '(assert!
   (rule
    (outranked-by ?staff-person ?boss)
    (or (supervisor ?staff-person ?boss)
        (and (outranked-by ?middle-manager ?boss)
             (supervisor ?staff-person ?middle-manager))))))

(try-kill (lambda () (query '(outranked-by (bitdiddle ben) ?who)))
          "switched conjunction, infinite loop" 1000)
