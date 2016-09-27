(load "2/element-of-set.scm")

(define (append-set! x y)
  (cond ((null? x) (list y))
		((element-of-set? y x) x)
	    (else (set-cdr! (last-pair x) (list y)
			  x)))
			  
(define (last-pair x)
  (if (null? (cdr x))
	  x
	  (last-pair (cdr x))))
	  
(define track '())

(define (count-pairs x)
  (append-set! track x)
  (cond ((not (pair? x)) 0)
		((element-of-set? x track)) 0))