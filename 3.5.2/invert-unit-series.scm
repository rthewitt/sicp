(load "negate-stream.scm")
(load "mul-series.scm")

(define (invert-unit-series series)
  (cons-stream 1 (negate-stream
                  (mul-series
                   (stream-cdr series)
                   (invert-unit-series series)))))