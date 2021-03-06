(define (make-monitored f)
  (define (mf input)
    (cond ((eq? input 'how-many-calls?) 
		   count)
		  ((eq? input 'reset-count) 
		   (set! count 0) 
		   count)
		  (else (set! count (+ count 1))
				(f input))))
  mf)