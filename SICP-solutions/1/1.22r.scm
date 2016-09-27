(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (real-time-clock)))

(define (start-prime-test n start-time)
	(if (prime? n)
		(report-prime (- (real-time-clock) start-time))))
		
(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))
	
(define (search-for-primes n count)
	(if (> count 0)
		(if (prime? (+ n 1))
			(and (timed-prime-test (+ n 1))
				(search-for-primes (+ n 2) (- count 1)))
			(search-for-primes (+ n 2) count))))