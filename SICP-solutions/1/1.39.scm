(define (cont-frac-i n d k)
	(define (iter k result)
		(if (= k 0)
			result
			(iter (- k 1) (/ (n k) (- (d k) result)))))
	(iter k 0.0))

(define (tan-cf x k)
	(cont-frac-i (lambda (k) (if (= k 1) x (* x x)))
				 (lambda (k) (- (* k 2) 1)) 
				 k))