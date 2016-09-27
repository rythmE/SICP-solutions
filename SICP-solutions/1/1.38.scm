(load "1.37.scm")

(define (n i) 1.0)
(define (d i)
	(if (= (remainder i 3) 2)
		(* 2 (+ (/ i 3) (/ 1 3)))
		1))

(define (e k)
	(+ 2 (cont-frac-i n d k)))