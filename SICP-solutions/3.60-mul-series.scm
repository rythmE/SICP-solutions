(define (add-streams s1 s2)
	(stream-map + s1 s2))
	
(define (scale-stream stream factor)
	(stream-map (lambda (x) (* x factor)) stream))

;错误答案
;(define (mul-series s1 s2)
	;(cons-stream (+ (stream-car s1) (stream-car s2))
							 ;(add-streams (add-streams (add-streams s1 (stream-cdr s2))
																				 ;(add-streams s2 (stream-cdr s1)))
													  ;(cons-stream 0 (mul-series (stream-cdr s1)
																											 ;(stream-cdr s2))))))
																											 
(define (mul-series s1 s2)
	(cons-stream (* (stream-car s1) (stream-car s2))
							 (add-streams (add-streams (scale-stream (stream-cdr s1) (stream-car s2))
																				 (scale-stream (stream-cdr s2) (stream-car s1)))
													  (cons-stream 0 (mul-series (stream-cdr s1)
																											 (stream-cdr s2))))))
;参考答案																										 
(define (mul-series2 s1 s2)
  (cons-stream (* (stream-car s1) (stream-car s2))
							 (add-streams 
									(scale-stream (stream-cdr s2)
																(stream-car s1))
									(mul-series (stream-cdr s1) s2))))