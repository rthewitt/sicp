#!/usr/bin/env chicken-scheme

(define (make-account balance account-password)
  (lambda (password message)
    (lambda (amount)
      (if (eq? account-password password)
          (case message
            ((withdraw)
             (if (>= balance amount)
                 (begin (set! balance (- balance amount))
                        balance)
                 "Insufficient funds"))
            ((deposit)
             (set! balance (+ balance amount))
             balance)
            (else (error "Unknown request: MAKE-ACCOUNT" message)))
          "Incorrect password"))))
