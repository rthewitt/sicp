;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define primitive-procedures
  (list (list 'car car)
        (list 'cadr cadr)
        (list 'cdr cdr)
        (list 'append! append!)
        (list 'cons cons)
        (list 'null? null?)
        (list 'zero? zero?)
        (list 'even? even?)
        (list 'pair? pair?)
        (list '1+ 1+)
        (list 'list list)
        (list 'memq memq)
        (list 'member member)
        (list 'not not)
        (list 'write-line write-line)
        (list '+ +)
        (list '- -)
        (list '* *)
        (list '= =)
        (list '> >)
        (list '>= >=)
        (list 'abs abs)
        (list 'remainder remainder)
        (list 'integer? integer?)
        (list 'sqrt sqrt)
        (list 'eq? eq?)
        (list 'equal? equal?)
        (list 'list-ref list-ref)
        (list 'random random)
        (list 'length length)
        (list '2d-put! 2d-put!)
        (list '2d-get 2d-get)
        (list 'error error)
;;         (list 'default-object? default-object?)
;;         (list '#!default #!default)
;;      more primitives
        ))
