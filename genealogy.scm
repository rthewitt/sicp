#!/usr/bin/env chicken-scheme

(define (with-genealogy thunk)
  (with-empty-database
   (lambda ()
     (qeval* '(assert! (son Adam Cain)))
     (qeval* '(assert! (son Cain Enoch)))
     (qeval* '(assert! (son Enoch Irad)))
     (qeval* '(assert! (son Irad Mehujael)))
     (qeval* '(assert! (son Mehujael Methushael)))
     (qeval* '(assert! (son Methushael Lamech)))
     (qeval* '(assert! (wife Lamech Ada)))
     (qeval* '(assert! (son Ada Jabal)))
     (qeval* '(assert! (son Ada Jubal)))
     
     (qeval* '(assert! (rule (wife-son ?father ?son)
                             (and (wife ?father ?mother)
                                  (son ?mother ?son)))))
     (qeval* '(assert! (rule (all-son ?father ?son)
                             (or (wife-son ?father ?son)
                                 (son ?father ?son)))))
     (qeval* '(assert! (rule (grandson ?grandfather ?grandson)
                             (and (all-son ?grandfather ?father)
                                  (all-son ?father ?grandson)))))
     
     (thunk))))
