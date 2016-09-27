
(define (make-n-mutex)
	(let ((pass 0))
		(if (test-pass! pass)
				(let ((mutex (make-mutex)))
					(lambda (p)
						(define (n-mutex-p . args)
							(mutex 'acquire)
							(let ((val (apply p args)))
								(mutex 'release)
								(set! pass (- pass 1))
								val))
					n-mutex-p)))))
					
(define (test-pass! pass)
	(if (= pass n)
			true
			(begin (set! pass (+ pass 1))
						 false)))
