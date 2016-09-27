(load "add-integers.scm")
(load "stream-scale-display.scm")
(load "integral.scm")

(define (RC R C dt)
	(define (v i v0)
		(add-streams (scale-stream i R)
								 (integral (scale-stream i (/ 1 C)) v0 dt)))
	v)
	
(define RC1 (RC 5 1 0.5))