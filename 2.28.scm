#!/usr/bin/env chicken-scheme
(use test)

(define (fringe tree)
  (let iter ((tree tree)
             (leaves '()))
    (if (null? tree)
        leaves
        (let ((first (car tree)))
          (iter (cdr tree)
                (append leaves 
                        (if (pair? first) 
                          (fringe first)
                          (list first))))))))

(define x '((1 2) (3 4)))
(test '(1 2 3 4) (fringe x))
(test '(1 2 3 4 1 2 3 4) (fringe (list x x)))
