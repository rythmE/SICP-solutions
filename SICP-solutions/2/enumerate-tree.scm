(load "list-append.scm")

(define (enumerate-tree tree)
	(cond ((null? tree) '())
		((not (piar? tree)) (list tree))
		(else (append (enumerate-tree (car tree))
					(enumerate-tree (cdr tree))))))