

(define (merge-weighted s1 s2 weight)
	(cond ((stream-null? s1) s2)
				((stream-null? s2) s1)
				(else
					(let ((s1car (stream-car s1))
								(s2car (stream-car s2)))
						(if (=< (weight s1car) (weight s2car))
								(cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight))
								(cons-stream s2car (merge-weighted s1 (stream-cdr s2) weight)))))))
																			 
(define (weighted-pairs s t weight)
	(cons-stream
		(list (stream-car s) (stream-car t))
		(merge-weighted
			(stream-map (lambda (x) (list (stream-car s) x))
									(stream-cdr t))
			(weighted-pairs (stream-cdr s) (stream-cdr t) weight)
			weight)))
			
(define (w1 pair) (+ (car pair) (cadr pair)))

(define (w2 pair)
	(+ (* (car pair) 2) (* (cadr pair) 3) (* (* (car pair) (cadr pair)) 5)))

(define 370a (weighted-pairs integers integers w1))	
	
(define 370b
	(cons-stream 
		1 
		(merge-weighted  
			(merge-weighted  
				(scale-stream S 2) (scale-stream S 3) w2)
			(scale-stream S 5) w2)))