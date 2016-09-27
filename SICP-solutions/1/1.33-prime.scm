(define (gcd a b)
	(if (= b 0)
		a
		(gcd b (remainder a b))))
		
(define (prime1 a b)
	(if (= (gcd a b) 1)
		true
		false))
		
(define (filtered-accumulate filter combiner null-value term a next b)
	(if (> a b)
		null-value
		(if (filter a b)
			(combiner (term a)
				(filtered-accumulate filter combiner null-value term (next a) next b))
			(filtered-accumulate filter combiner null-value term (next a) next b))))