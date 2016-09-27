(load "1.3.3-fixed-point.scm")

(define (phi)
	(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))