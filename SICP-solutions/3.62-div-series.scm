(load "3.61-invert-stream.scm")

(define (div-series s1 s2)
	(if (= (stream-car s2) 0)
			(error "the divisor is 0 -- (STREAM-CAR S2)" (stream-car s2))
			(mul-series s1 (invert s2))))