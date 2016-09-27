
(define (make-mutex) ; (define (make-mutex n)
	(let ((cell (list 0)))
		(define (the-mutex m)
			(cond ((eq? m 'acquire)
						 (if (test-and-set! cell)	; (if (test-and-set! cell n)
								 (the-mutex 'acquire))) ; retry
						((eq? m 'release) (clear! cell))))
	the-mutex))
	
(define (clear! cell)
	(set-car! cell (- (car cell) 1)))
	
(define (test-and-set! cell)	; (define (test-and-set! cell n)
	(if (= (car cell) n)
			true
			(begin (set-car! cell (+ (car cell) 1))
						 false)))