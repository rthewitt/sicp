#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.53][2\.53:1]]

(use test)

(test '(a b c) (list 'a 'b 'c))
(test '((george)) (list (list 'george)))
(test '((y1 y2)) (cdr '((x1 x2) (y1 y2))))
(test '(y1 y2) (cadr '((x1 x2) (y1 y2))))
(test #f (pair? (car '(a short list))))
(test #f (memq 'red '((red shoes) (blue shoes))))
(test '(red shoes blue shoes) (memq 'red '(red shoes blue shoes)))

;; 2\.53:1 ends here
