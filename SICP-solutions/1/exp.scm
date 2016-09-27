(load "base.scm")

(define (even? n)
	(= (remainder n 2) 0))
	
(define (exp x n)
	(if (= n 1)
		x
		(if (even? n)
			(square (exp x (/ n 2)))
			(* x (exp x (- n 1))))))