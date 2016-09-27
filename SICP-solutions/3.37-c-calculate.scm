(load "constraint-interface.scm")
(load "adder-mul-const.scm")
(load "make-connector.scm")

(define (c+ a b)
	(let ((c (make-connector)))
		(adder a b c)
		c))
		
(define (c- a b)
	(let ((c (make-connector)))
		(adder b c a)
		c))
		
(define (c* a b)
	(let ((c (make-connector)))
		(multiplier a b c)
		c))
		
(define (c/ a b)
	(let ((c (make-connector)))
		(multiplier b c a)
		c))
		
(define (cv a)
	(let ((c (make-connector)))
		(constant c a)
		c))