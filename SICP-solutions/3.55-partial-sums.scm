(load "add-integers.scm")

(define (partial-sums-own s)
	(cons-stream (stream-car s) 
							 (add-streams (partial-sums (stream-cdr s))
														(stream-car s))))
														
; 参考答案1
(define (partial-sums s)
    (cons-stream (stream-car s)
                 (add-streams (partial-sums s)
                              (stream-cdr s))))
															
; 参考答案2
(define (partial-sum2 s)
	(stream-add s (stream-cons 0 (parital-sum s))))