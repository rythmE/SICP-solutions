(define (iterative-improve good-enough? improve-method)
	(lambda (guess)
		(define (try guess)
			(if (good-enough? improve-method guess)
				(improve-method guess)
				(try (improve-method guess))))
		(try guess)))

(define tolerance 0.00001)		

(define (good-fix? f guess)
	(lambda (f)
		(lambda (guess)
			(define (close-enough? v1 v2)
				(< (abs (- v1 v2)) tolerance))
			(close-enough? guess (f guess)))))
		
(define (fixed-point-it f first-guess)
	((iterative-improve good-fix? f) first-guess))