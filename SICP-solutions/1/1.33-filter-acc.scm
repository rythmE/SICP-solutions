(define (filtered-accumulate filter combiner null-value term a next b)
	(if (> a b)
		null-value
		(if (filter a)
			(combiner (term a)
				(filtered-accumulate filter combiner null-value term (next a) next b))
			(filtered-accumulate filter combiner null-value term (next a) next b))))

(define (filtered-accumulate-i filter combiner null-value term a next b)
	(define (iter a result)
		(if (> a b)
			null-value 
			(if (filter a)
				(iter (next a) (combiner (term a) result))
				(iter (next a) result))))
	(iter a null-value))