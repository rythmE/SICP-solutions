(load "list-append.scm")

(define (adjoin x set)
  (define (insert x back front)
    (if (or (null? back) (< x (car back))) 
		(append front (cons x back))
		(insert x (cdr back) (append front (list (car back)))))))