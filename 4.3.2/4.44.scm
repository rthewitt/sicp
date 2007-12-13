;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "ambeval-global-until-fail.scm")
(load "require.scm")
(load "an-integer-between.scm")
(load "safe?.scm")
(load "queens.scm")

(install-packages)
(ambeval-global require)
(ambeval-global an-integer-between)
(ambeval-global safe?)

(define 8-queens (ambeval-global-until-fail (queens 8)))

(test
 "8-queens generates 92 distinct solutions (not 12 unique)"
 '((1 5 8 6 3 7 2 4) (1 6 8 3 7 4 2 5) (1 7 4 6 8 2 5 3) (1 7 5 8 2 4 6 3) (2 4 6 8 3 1 7 5) (2 5 7 1 3 8 6 4) (2 5 7 4 1 8 6 3) (2 6 1 7 4 8 3 5) (2 6 8 3 1 4 7 5) (2 7 3 6 8 5 1 4) (2 7 5 8 1 4 6 3) (2 8 6 1 3 5 7 4) (3 1 7 5 8 2 4 6) (3 5 2 8 1 7 4 6) (3 5 2 8 6 4 7 1) (3 5 7 1 4 2 8 6) (3 5 8 4 1 7 2 6) (3 6 2 5 8 1 7 4) (3 6 2 7 1 4 8 5) (3 6 2 7 5 1 8 4) (3 6 4 1 8 5 7 2) (3 6 4 2 8 5 7 1) (3 6 8 1 4 7 5 2) (3 6 8 1 5 7 2 4) (3 6 8 2 4 1 7 5) (3 7 2 8 5 1 4 6) (3 7 2 8 6 4 1 5) (3 8 4 7 1 6 2 5) (4 1 5 8 2 7 3 6) (4 1 5 8 6 3 7 2) (4 2 5 8 6 1 3 7) (4 2 7 3 6 8 1 5) (4 2 7 3 6 8 5 1) (4 2 7 5 1 8 6 3) (4 2 8 5 7 1 3 6) (4 2 8 6 1 3 5 7) (4 6 1 5 2 8 3 7) (4 6 8 2 7 1 3 5) (4 6 8 3 1 7 5 2) (4 7 1 8 5 2 6 3) (4 7 3 8 2 5 1 6) (4 7 5 2 6 1 3 8) (4 7 5 3 1 6 8 2) (4 8 1 3 6 2 7 5) (4 8 1 5 7 2 6 3) (4 8 5 3 1 7 2 6) (5 1 4 6 8 2 7 3) (5 1 8 4 2 7 3 6) (5 1 8 6 3 7 2 4) (5 2 4 6 8 3 1 7) (5 2 4 7 3 8 6 1) (5 2 6 1 7 4 8 3) (5 2 8 1 4 7 3 6) (5 3 1 6 8 2 4 7) (5 3 1 7 2 8 6 4) (5 3 8 4 7 1 6 2) (5 7 1 3 8 6 4 2) (5 7 1 4 2 8 6 3) (5 7 2 4 8 1 3 6) (5 7 2 6 3 1 4 8) (5 7 2 6 3 1 8 4) (5 7 4 1 3 8 6 2) (5 8 4 1 3 6 2 7) (5 8 4 1 7 2 6 3) (6 1 5 2 8 3 7 4) (6 2 7 1 3 5 8 4) (6 2 7 1 4 8 5 3) (6 3 1 7 5 8 2 4) (6 3 1 8 4 2 7 5) (6 3 1 8 5 2 4 7) (6 3 5 7 1 4 2 8) (6 3 5 8 1 4 2 7) (6 3 7 2 4 8 1 5) (6 3 7 2 8 5 1 4) (6 3 7 4 1 8 2 5) (6 4 1 5 8 2 7 3) (6 4 2 8 5 7 1 3) (6 4 7 1 3 5 2 8) (6 4 7 1 8 2 5 3) (6 8 2 4 1 7 5 3) (7 1 3 8 6 4 2 5) (7 2 4 1 8 5 3 6) (7 2 6 3 1 4 8 5) (7 3 1 6 8 5 2 4) (7 3 8 2 5 1 6 4) (7 4 2 5 8 1 3 6) (7 4 2 8 6 1 3 5) (7 5 3 1 6 8 2 4) (8 2 4 1 7 5 3 6) (8 2 5 3 1 7 4 6) (8 3 1 6 2 5 7 4) (8 4 1 3 6 2 7 5))
 8-queens
 'equal? equal?
 "http://en.wikipedia.org/wiki/Eight_queens_puzzle#Solutions_to_the_eight_queens_puzzle")
