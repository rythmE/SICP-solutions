(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (runtime)))

(define (start-prime-test n start-time)
	(if (fast-prime? n 6)
		(report-prime (- (runtime) start-time))))
		
(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))
	
(define (search-for-primes n count)
	(if (> count 0)
		(if (fast-prime? (+ n 1) 6)
			(and (timed-prime-test (+ n 1))
				(search-for-primes (+ n 2) (- count 1)))
			(search-for-primes (+ n 2) count))))