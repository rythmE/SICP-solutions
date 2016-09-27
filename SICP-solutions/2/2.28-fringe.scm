(load "list-append.scm")

(define (fringe x)
	(cond ((null? x) x)
		((pair? (car x)) (if (null? (cdr x)) 
								(fringe (car x))
								(append (fringe (car x)) (fringe (cdr x)))))		
		(else (cons (car x) (fringe (cdr x))))))
		
				