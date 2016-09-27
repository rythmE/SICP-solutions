
(define (sign-change-detector x y)
	(cond ((and (> x 0) (< y 0)) -1)
				((and (< x 0) (> y 0)) 1)
				(else 0)))

(define sense-data 
	(list->stream (list 1 2 1.5 1 0.5 -0.1 -2 -3 -2 -0.5 0.2 3 4)))	
	
(define (make-zero-crossings input-stream last-value last-avpt)
	(let ((avpt (/ (+ (stream-car input-stream) last-value) 2)))
		(cons-stream (sign-change-detector avpt last-avpt)
								 (make-zero-crossings 
										(stream-cdr input-stream) 
										(stream-car input-stream) avpt))))
										
(define zero-crossings (make-zero-crossings sense-data 0 0))