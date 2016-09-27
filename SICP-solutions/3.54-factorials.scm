(load "add-integers.scm")

(define (mul-streams s1 s2)
	(stream-map * s1 s2))

(define factorials 
	(cons-stream 1 (mul-streams (add-streams ones intergers) factorials)))	
	; (add-streams ones intergers) 可换乘 (cdr integers)