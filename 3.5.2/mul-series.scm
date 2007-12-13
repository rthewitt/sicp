;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "scale-stream.scm")
(load "add-series.scm")

;; McIlroy, "Squinting at Power Series", 4.
;; (define (mul-series s1 s2)
;;   (let ((s1-0 (stream-car s1))
;;         (s2-0 (stream-car s2))
;;         (s1-1->k (stream-cdr s1))
;;         (s2-1->k (stream-cdr s2)))
;;     (cons-stream (* s1-0 s2-0)
;;                  (add-streams (scale-stream s1-1->k s2-0)
;;                               (add-streams (scale-stream s2-1->k s1-0)
;;                                            (mul-series s1-1->k s2-1->k))))))

;; Refined by John Berthels, evades the out-maxed recursion.
(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1) (stream-car s2))
               (add-series (scale-stream (stream-cdr s2) (stream-car s1))
                           (mul-series (stream-cdr s1) s2))))
