(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (real-time-clock)))

(define (start-prime-test n start-time)
	(if (fast-prime? n 6)
		(report-prime (- (real-time-clock) start-time))))
		
(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))
	
(define (search-for-primes n count)
	(if (> count 0)
		(if (fast-prime? (+ n 1) 6)
			(search-for-primes (+ n 2) (- count 1))
			(search-for-primes (+ n 2) count))))
			
(define (search-primes n)
    (let ((start-time (real-time-clock)))
        (search-for-primes n 3)
        (- (real-time-clock) start-time)))