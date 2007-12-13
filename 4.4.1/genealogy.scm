;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define genealogy
  '((assert! (son Adam Cain))
    (assert! (son Cain Enoch))
    (assert! (son Enoch Irad))
    (assert! (son Irad Mehujael))
    (assert! (son Mehujaol Methushael))
    (assert! (son Methushael Lamech))
    (assert! (wife Lamech Ada))
    (assert! (son Ada Jabal))
    (assert! (son Ada Jubal))
    (assert! (rule (grandson ?s ?g)
                   (and (son ?s ?f)
                        (son ?f ?g))))
    (assert! (rule (son ?m ?s)
                   (and (wife ?m ?w)
                        (son ?w ?s))))))
