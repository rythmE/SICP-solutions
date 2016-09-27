(define (for-each f l)
	(cond ((null? l) true)
		(else (f (car l))
			(for-each f (cdr l)))))