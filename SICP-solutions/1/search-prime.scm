(define (search-for-primes n)
	(if (prime? (+ n 1))
		(timed-prime-test (+ n 1))
		(search-for-primes (+ n 2))))
		