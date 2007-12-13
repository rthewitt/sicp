;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-connector.scm")
(load "celsius-fahrenheit-converter.scm")
(load "probe.scm")
(load "set-value!.scm")
(load "forget-value!.scm")

(define C (make-connector))
(define F (make-connector))
(celsius-fahrenheit-converter C F)
(probe "Celsius temp" C)
(probe "Fahrenheit temp" F)
(set-value! C 25 'user)
(set-value! F 212 'user)
(forget-value! C 'user)
(set-value! F 212 'user)
