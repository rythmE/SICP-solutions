(load "1.3.4-newton.scm")

(define (cubic a b c)
	(lambda (x)
		(+ (* x x x)
		(* a (* x x))
		(* b x)
		c)))