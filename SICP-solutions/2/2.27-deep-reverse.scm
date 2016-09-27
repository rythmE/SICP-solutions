(define (deep-reverse items)
	(define (cr old new)
		(define (lr x n)
			(if (not (pair? x))
				x
				(cr x n)))
		(if (null? old) 
			new
			(cr (cdr old) (cons (lr (car old) '()) new))))
	(cr items '()))