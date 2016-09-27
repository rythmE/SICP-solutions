(define (reverse items)
	(define (cr old new)
		(if (null? old)
			new
			(cr (cdr old) (cons (car old) new))))
	(cr items '()))