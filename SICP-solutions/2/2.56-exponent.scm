(load "sum&product.scm")

(define (exponentiation? x) 
  (and (pair? x) (= (car x) '**)))
  
(define (base e) (cadr e))

(define (exponent e) (caddr e))

(define (make-exponentiation b e)
  (cond ((=number? exp 0) 1)
		((=number? exp 1) b)
		(else (list '** b e))))

(define (deriv exp var)
  (cond ((number? exp) 0)
		((variable? exp)
		 (if (same-variable? exp var) 1 0))
		((sum? exp)
		 (make-sum (deriv (addend exp) var)
				   (deriv (augend exp) var)))
		((product? exp)
		 (make-sum 
		   (make-product (multiplier exp)
						 (deriv (multiplicand exp) var))
		   (make-product (deriv (multiplier exp) var)
						 (multiplicand exp))))
		(exponentiation? exp)
		 (make-product (make-product var 
									 (make-exponentiation exp 
									  (make-sum var '-1))) 
						(deriv (base exp) var))
		(else
		 (error "unknown expression type -- DERIV" exp))))