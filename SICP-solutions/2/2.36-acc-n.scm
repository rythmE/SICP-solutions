(load "accumulate.scm")

(define (accumulate-n op init seqs)
	(if (null? (car seqs))
		'()
		(cons (accumulate op init (map (lambda (s) (if (null? s) '() (car s))) seqs))
			(accumulate-n op init (map (lambda (s) (if (null? (cdr s)) '() (cdr s))) seqs)))))