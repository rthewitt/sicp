#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.31][3\.31:1]]

(use debug sicp test)

(parameterize ((the-agenda (make-agenda)))
  (let ((input-1 (make-wire))
        (input-2 (make-wire))
        (sum (make-wire))
        (carry (make-wire)))
    (probe 'sum sum)
    (probe 'carry carry)
    (half-adder input-1 input-2 sum carry)
    (set-signal! input-1 1)
    (propagate)))

(define make-wire-no-proc
  (case-lambda
   (() (make-wire 0))
   ((signal-value)
    (let ((action-procedures '()))
      (define (set-my-signal! new-value)
        (if (not (= signal-value new-value))
            (begin (set! signal-value new-value)
                   (call-each action-procedures))
            'done))
      (define (accept-action-procedure! proc)
        (set! action-procedures
              (cons proc action-procedures)))
      (define (dispatch m)
        (cond ((eq? m 'get-signal) signal-value)
              ((eq? m 'set-signal!) set-my-signal!)
              ((eq? m 'add-action!) accept-action-procedure!)
              (else (error "Unknown operation: WIRE" m))))
      dispatch))))

(parameterize ((the-agenda (make-agenda)))
  (let ((input-1 (make-wire-no-proc))
        (input-2 (make-wire-no-proc))
        (sum (make-wire-no-proc))
        (carry (make-wire-no-proc)))
    (probe 'sum sum)
    (probe 'carry carry)
    (half-adder input-1 input-2 sum carry)
    (set-signal! input-1 1)
    (propagate)
    (get-signal sum)))

;; 3\.31:1 ends here
