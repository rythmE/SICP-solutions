(load "3.60-mul-series.scm")
(load "3.59-series.scm")

(define (negative s)
	(cons-stream (- 0 (stream-car s))
							 (negative (stream-cdr s))))

(define 1-div-exp (cons-stream 1 
						(negative (mul-series (stream-cdr exp-series)
						1-div-exp))))
						
(define (invert s)
	(define inv-s (cons-stream 1 
									(scale-stream 
										(mul-series (stream-cdr s) inv-s) -1)))
	inv-s)