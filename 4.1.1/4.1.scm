;;(load "eval.scm")
(load "the-global-environment.scm")
(load "driver-loop.scm")
;;(load "/tmp/ch4-mceval.scm")

(driver-loop)

;; (eval '(define f (lambda () 1)) the-global-environment)
;; (eval '(f) the-global-environment)
;; (eval '(cons 1 2) the-global-environment)
;; (eval '(define current 1) the-global-environment)
;; ;;(eval '(define (* x y) (cond ((= x 0) 0) ((= y 0)) (else x))) the-global-environment)
;; (eval '(define new-f (lambda (x) (set! current (* current x)) current)) the-global-environment)
;; (eval '(define f new-f) the-global-environment)
;; (eval '(f 0) the-global-environment)
;;(eval '(define current 1) the-global-environment)
;; (eval '(define (f x) (set! current (* current x)))
;;       the-global-environment)
;;(eval '(f 0) the-global-environment)
;;(eval '(f 1) the-global-environment)
;; (eval '(define + 2) the-global-environment)
;; (eval '+ the-global-environment)
;; (eval '(set! current 2) the-global-environment)
;; (eval 'current the-global-environment)
;; (eval '(define f (lambda (x) x)) the-global-environment)
;; (eval '(f 1) the-global-environment)
;; (eval '(define y (cons 1 2)) the-global-environment)
