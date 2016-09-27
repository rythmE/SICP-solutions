(define (element-of-set? x set)
  (cond ((null? set) false)
		((equal? x (car set)) true)
		((element-of-set? x (cdr set)))))
		
(define (adjoin-set x set)
  (cons x set))
  
(define (intersection-set set1 set2)
  (define (inter set1 set2 inset)
    (cond ((or (null? set1) (null? set2)) inset)
		  ((and (element-of-set? (car set1) set2)
				(not (element-of-set? (car set1) inset)))
			(inter (cdr set1) set2 (cons (car set1) inset)))
		  (else (inter (cdr set1) set2 inset))))
  (inter set1 set2 '()))
  
(define (union-set set1 set2)
  (cond ((null? set1) set2)
		((not (element-of-set? (car set1) set2))
		 (cons (car set1) 
			   (union-set (cdr set1) set2)))
		(else (union-set (cdr set1) set2))))
  
