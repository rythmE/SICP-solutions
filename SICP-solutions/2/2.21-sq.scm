(define (square-list items)
	(if (null? items)
		'()
		(cons ((lambda (x) (* x x)) (car items))
				(square-list (cdr items)))))
	