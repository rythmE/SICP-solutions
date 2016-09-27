(load "1.42-compose.scm")

(define (repeated f n)
	(if (= n 1)
		(lambda (x) (f x))
		(repeated (compose f f) (- n 1))))