(load "list-append.scm")
(load "2.58a-middle.scm")

(define (sum? x)
  (if (null? (cdr x))
	  false
	  (or (and (pair? x) (eq? (cadr x) '+))
		  (and (and (pair? x) (eq? (cadr x) '*))
			   (sum? (cddr x))))))
  
(define (addend s)
 (define (contimul s l) ;连乘式，返回连乘式各项包括符号组成的表
	(if (and (pair? s) (eq? (cadr s) '*))
		(contimul (cddr s) (append l (list (cadr s) (caddr s))))
		l)) ;因为这是在sum?检测后进行的，所以连乘过后一定是符号+
 (if (and (pair? s) (eq? (cadr s) '+))
	 (car s)
	 (contimul s (list (car s)))))

(define (augend s)
 (define (select s)
	(cond ((and (pair? s) (eq? (cadr s) '*))
			(select (cddr s)))
		  ((null? (cdddr s)) (caddr s))  
		  (else (cddr s))))
 (cond ((null? (cdddr s)) (caddr s))
	   ((and (pair? s) (eq? (cadr s) '+))
		(cddr s))
	   (else (select s))))
	 
(define (product? x)
  (if (null? (cdr x))
	  false
	  (or (and (and (pair? x) (eq? (cadr x) '*))
			   (null? (cdddr x)))
		  (and (and (pair? x) (eq? (cadr x) '*))
			   (product? (cddr x))))))
	  
(define (multiplier p) (car p))

(define (multiplicand p)
  (if (null? (cdddr p))
	  (caddr p)
	  (cddr p)))