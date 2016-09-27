(load "monte-carlo-stream.scm")

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))
	
(define randx
  (let ((x (random-in-range 2.0 8)))
    (lambda ()
	  (set! x (rand-update x))
	  x)))
	  
(define randy
  (let ((y (random-in-range 4.0 10)))
    (lambda ()
	  (set! y (rand-update y))
	  y)))
		
(define random-pairs
	(cons-stream (cons (random-in-range 2.0 8)
										 (random-in-range 4.0 10))
							 random-pairs))
							 
(define (P s)
  (<= (+ (square (- (car s) 5))
		 (square (- (cadr s) 7)))
	  1))
		
(define P-stream
	(stream-map P random-pairs))
	
(define (estimate-integral P-stream x1 x2 y1 y2)
  (let ((h (- y2 y1))
		(w (- x2 x1)))
	(* (monte-carlo P-stream 0 0) (* w h))))