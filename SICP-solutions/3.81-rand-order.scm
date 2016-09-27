(define random-numbers
	(cons-stream random-init
							 (stream-map rand-update random-numbers)))

(define (rand order)
  (define generate
		random-numbers)
  (define (reset value)
    (cons-stream value
							 (stream-map rand-update random-numbers)))
  (cond ((eq? order 'generate) (generate))
		((eq? order 'reset) reset)
		(else (error "Unknown request -- RAND" order))))