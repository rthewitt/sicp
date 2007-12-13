;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define multiple-dwelling-hierarchical
  '(define (multiple-dwelling-hierarchical)
     (let ((baker (amb 1 2 3 4)))
       (let ((cooper (amb 2 3 4 5)))
         (let ((fletcher (amb 2 3 4)))
           (require (not (= (abs (- fletcher cooper)) 1)))
           (let ((miller (amb 3 4 5)))
             (require (> miller cooper))
             (let ((smith (amb 1 2 3 4 5)))
               (require (not (= (abs (- smith fletcher)) 1)))
               (require
                (distinct? (list baker cooper fletcher miller smith)))
               (list (list 'baker baker)
                     (list 'cooper cooper)
                     (list 'fletcher fletcher)
                     (list 'miller miller)
                     (list 'smith smith)))))))))
