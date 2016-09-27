(define (left-branch m) (car m))

(define (right-branch m) (cdr m))

(define (branch-length b) (car b))

(define (branch-structure b) (cdr b))

(define (total-weight m) 
	(if (and (not (pair? (branch-structure (left-branch m))))
			(not (pair? (branch-structure (right-branch m)))))
		(+ (branch-structure (left-branch m))
			(branch-structure (right-branch m)))
		(+ (total-weight (left-branch m)) 
			(total-weight (right-branch m)))))