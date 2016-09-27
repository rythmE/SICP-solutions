(load "3.66-pair-integers.scm")

(define (pairs-Louis s t)
	(interleave
		(stream-map (lambda (x) (list (stream-car s) x))
								t)
		(pairs (stream-cdr s) (stream-cdr t))))