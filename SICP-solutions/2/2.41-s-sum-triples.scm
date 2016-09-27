(load "filter.scm")
(load "flatmap.scm")
(load "enumerate-interval.scm")
(load "list-append.scm")

(define (unitri n)
		(accumulate
		 append
		 '()
		 (flatmap
			(lambda (i)
				(map (lambda (j) 
						(map (lambda (k) (list i j k))	
						(enumerate-interval (+ j 1) n)))
				(enumerate-interval (+ i 1) n)))
			(enumerate-interval 1 n))))
			
(define (s-sum-triples n s)
	(define (s-sum? triple)
		(= s (+ (car triple) (cadr triple) (caddr triple))))
	(map make-triple-sum
		(filter s-sum? (unitri n))))
			
(define (make-triple-sum triple)
	(list (car triple) (cadr triple) (caddr triple)))
			
