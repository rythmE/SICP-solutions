(load "3.70-merge-weighted.scm")

(define (cube x) (* x x x))

(define (cube-sum pair)
	(let ((i (car pair))
				(j (cadr pair)))
		(+ (cube i) (cube j))))
		
(define cs (weighted-pairs integers integers cube-sum))

(define css (stream-map cube-sum cs))

(define (pair2 s) 
	(cons-stream (list (stream-car s) (stream-car (stream-cdr s)))
							 (pair2 (stream-cdr s))))

(define (same? pair) (= (car pair) (cadr pair)))
 
(define Ramanujan 
	(stream-map (lambda (x) (car x)) 
							(stream-filter same? (pair2 css))))

