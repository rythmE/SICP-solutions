(load "3.54-factorials.scm")
(load "add-integers.scm")

; a)

(define (div-streams s1 s2)
	(stream-map / s1 s2))

(define (integrate-series s)
	(mul-streams (div-streams ones integers) s))
	
; b)

(define (negative s)
	(cons-stream (- 0 (stream-car s))
							 (negative (stream-cdr s))))

(define exp-series
	(cons-stream 1 (integrate-series exp-series)))

(define cosine-series
	(cons-stream 1 (integrate-series (negative sine-series))))

(define sine-series
	(cons-stream 0 (integrate-series cosine-series)))
	
