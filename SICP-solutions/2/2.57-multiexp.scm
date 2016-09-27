(load "sum-product.scm")
(load "list-append.scm")
  
(define (addend s) (cadr s))

(define (augend s)
  (if (null? (cdddr s))
	  (caddr s)
	  (append (list '+) (cddr s))))
  
(define (multiplier p) (cadr p))

(define (multiplicand p)
  (if (null? (cdddr p))
	  (caddr p)
	  (append (list '*) (cddr p))))