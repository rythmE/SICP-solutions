(load "1.3.3-fixed-point.scm")
(load "1.43-fnx.scm")
(load "exp.scm")

(define (avarage x y) (* (/ 1 2) (+ x y)))

(define (average-damp f)
	(lambda (x) (avarage x (f x))))
	
(define (nroot x)
	(fixed-point (lambda (y) (/ x (exp y n))) 1.0))
