(load "enumerate-interval.scm")
(load "filter.scm")
(load "1/prime.scm")
(load "accumulate.scm")

(define (unique-pairs n)
	(accumulate append
		'()
		(map (lambda (i)
			  (map (lambda (j) (list i j))
				(enumerate-interval 1 (- i 1))))
			(enumerate-interval 1 n))))
			
(define (prime-sum-pairs n)
	(map make-pair-sum
		(filter prime-sum?
			(unique-pairs n))))
	
(define (prime-sum? pair)
	(prime? (+ (car pair) (cadr pair))))
	
(define (make-pair-sum pair)
	(list (car pair) (cadr pair) (+ (car pair) (cadr pair))))