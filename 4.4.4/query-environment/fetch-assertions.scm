;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (fetch-assertions pattern environment)
  (if (use-index? pattern)
      (get-indexed-assertions pattern)
      (get-all-assertions)))
