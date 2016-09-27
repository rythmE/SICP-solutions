(define dx 0.00001)

(define (smooth f)
	(lambda (x) 
		(* (/ 1 3) (+ (f (- x dx)) (f x) (f (+ x dx))))))
		
(define (smooth f n)
	(repeated (smooth f) n))